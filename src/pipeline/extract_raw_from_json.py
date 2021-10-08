import json
import subprocess
from utils.utils import *
from utils.database_connection import *
from utils.file_content_toString import *
from psycopg2.extras import execute_batch
from alive_progress import alive_bar
from dotenv import load_dotenv

load_dotenv()


BATCH_SIZE = 100000


def extract_raw_from_json(table_name, file_path, query_path):
    """
    This function extracts json file into raw_tables, 
    :param table_name: The name of table to extract json. 
    :param file_path: The json file path. 
    :param query_path: The sql query path to help insert into the table.
    """
    try:

        # Database Connection
        con = databaseConnect()
        cur = con.cursor()

        # Count number of rows from json file to estimate time to extract
        cmd = f'cat {file_path} | wc -l'
        completion = subprocess.check_output(cmd, shell=True)
        print(
            f"\n[{SUCCESS}INFO{END}] {BOLD}Extract ({file_path}: {int(completion)} rows) into raw.{END}")

        # Empty table before extraction
        cur.execute(f'TRUNCATE TABLE {table_name};')

        # Get content of query_path as string
        extract_query = file_content_toString(query_path)

        # Extract with temp_table to handle nested json
        if table_name == 'raw_business':
            subprocess.Popen(
                f'psql {os.getenv("DATABASE_USER") } -h {os.getenv("HOST")} -d {os.getenv("DATABASE_NAME")} -f {query_path}', 
                  shell=True)

        else:
            i = 0
            filtered_data = []

            # Read json file and batch insert data.
            with open(file_path, 'r', encoding='utf8') as json_file:
                with alive_bar(int(completion)) as bar:
                    for line in (json_file):
                        data = []
                        data.append(json.loads(line))
                        data = [[str(value) for value in item.values()]
                                for item in data]
                        filtered_data.append(data[0])
                        bar()

                        if i == BATCH_SIZE:
                            execute_batch(cur, extract_query, filtered_data)
                            con.commit()
                            filtered_data = []
                            i = 0
                            continue
                        i += 1

            # Extract remaining data if less than batch size.
            if len(filtered_data) != 0:
                execute_batch(cur, extract_query, filtered_data)
                con.commit()

        print(f'[{SUCCESS}INFO{END}] {BOLD}Extraction Completed !{END}\n')
        databaseDisconnect(con, cur)

    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}', e)


if __name__ == '__main__':
    extract_raw_from_json('raw_checkin', '../../data/checkin.json',
                          '../sql/queries/extract_raw_checkin.sql')
    extract_raw_from_json('raw_business', '../../data/business.json',
                          '../sql/queries/extract_raw_business.sql')
    extract_raw_from_json('raw_photos', '../../data/photos.json',
                          '../sql/queries/extract_raw_photos.sql')
    extract_raw_from_json('raw_tip', '../../data/tip.json',
                          '../sql/queries/extract_raw_tip.sql')
    extract_raw_from_json('raw_user', '../../data/user.json',
                          '../sql/queries/extract_raw_user.sql')
    extract_raw_from_json('raw_review', '../../data/review.json',
                          '../sql/queries/extract_raw_review.sql')
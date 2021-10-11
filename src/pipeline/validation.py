from utils.utils import *
from utils.database_connection import *
from utils.file_content_toString import *

con = databaseConnect()
cur = con.cursor()

VALID = ''

def validate(query_path):
    total_files = len(os.listdir(query_path))
    for i in range(total_files):
        file_name = os.listdir(query_path)[i]
        print(f'[{SUCCESS}INFO{END}] {BOLD}Validating .... {file_name}{END}')

        query = file_content_toString(query_path+'/'+file_name)
        cur.execute(query)
        result = cur.fetchone()
        if(str(result) == "(0, 'passed')"):
            VALID = 'true'
            print(f'{SUCCESS}   ==> Validation passed.{END}')
        else:
            VALID = 'false'
            print(f'{FAILURE}   ==> Validation failed.{END}')
    if VALID == 'true':
        print(f'\n{SUCCESS}[+] Validation Successful !{END}')
    else:
        print(f'{FAILURE}\n[-] Validation error in data. Check before furthur process ...{END}')
        exit()


if __name__ == '__main__':
    validate('/home/saphal/1Saphal/20Data_Engineering/Yelp-ETL/src/sql/validation_scripts')

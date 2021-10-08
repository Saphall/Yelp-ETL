import time 
from utils.utils import *
from utils.database_connection import *
from utils.file_content_toString import *

con = databaseConnect()
cur = con.cursor()


def transform_raw_tables(transform_procedure):
    """
    This function transfoms raw_tables into standard tables.  
    :param transform_procedure: The sql procedure path to help transform into standard tables. 
    """
    try:
        table_name = transform_procedure.split('/')[3].replace('.sql','').replace('transform_','')
        transformation_sql = file_content_toString(transform_procedure)
        print(f'\n[{SUCCESS}Info{END}] {BOLD}Transforming into {table_name} table...{END}')
        start_time = time.time()
        cur.execute(transformation_sql)
        con.commit()
        print(f'[{SUCCESS}INFO{END}] {BOLD}Transformation Successful!{END}')
        print(f'{SUCCESS}[+] Elapsed Time: {(time.time() - start_time):.4f} seconds.{END}')
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}',e)



if __name__ == '__main__':
    transform_raw_tables('../sql/procedures/transform_std_business.sql')
    transform_raw_tables('../sql/procedures/transform_std_photos.sql')
    transform_raw_tables('../sql/procedures/transform_std_user.sql')
    transform_raw_tables('../sql/procedures/transform_std_checkin.sql')
    transform_raw_tables('../sql/procedures/transform_std_tip.sql')
    transform_raw_tables('../sql/procedures/transform_std_review.sql')
   
    databaseDisconnect(con,cur)
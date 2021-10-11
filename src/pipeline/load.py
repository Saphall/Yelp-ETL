import time 
from utils.utils import *
import validation
from utils.database_connection import *
from utils.file_content_toString import *

con = databaseConnect()
cur = con.cursor()


def load_tables(load_procedure):
    """
    This function loads std_tables into dimensions and facts.  
    :param load_procedure: The sql procedure path to help transform into fact and dimension tables. 
    """
    try:
        table_name = load_procedure.split('/')[3].replace('.sql','').replace('load_','')
        transformation_sql = file_content_toString(load_procedure)
        print(f'\n[{SUCCESS}Info{END}] {BOLD}Loading into {table_name} table...{END}')
        start_time = time.time()
        cur.execute(transformation_sql)
        con.commit()
        print(f'[{SUCCESS}INFO{END}] {BOLD}Load Successful!{END}')
        print(f'{SUCCESS}[+] Elapsed Time: {(time.time() - start_time):.4f} seconds.{END}')
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}',e)



if __name__ == '__main__':
    load_tables('../sql/procedures/load_dim_location.sql')
    load_tables('../sql/procedures/load_dim_categories.sql')
    load_tables('../sql/procedures/load_dim_business_categories.sql')
    load_tables('../sql/procedures/load_fact_business.sql')
    load_tables('../sql/procedures/load_dim_photos.sql')
    load_tables('../sql/procedures/load_dim_elite_years.sql')
    load_tables('../sql/procedures/load_fact_user.sql')
    load_tables('../sql/procedures/load_fact_checkin.sql')
    load_tables('../sql/procedures/load_fact_tip.sql')
    load_tables('../sql/procedures/load_fact_review.sql')
    
    databaseDisconnect(con,cur)
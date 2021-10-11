import subprocess
from utils.utils import *
from validation import validate
from datetime import datetime

#execution_time = "2021-10-11 6:26:00"
extract = 'python extract_raw_from_json.py'
transform = 'python transformation.py'
load = 'python load.py'
    

def execute_etl(user_input,execution_time):
    execution_time = execution_time.replace("'",'')
    print(f'''[{SUCCESS}TIME{END}] {BOLD}{execution_time.replace("'",'')}{END}''')
    print(f'{BOLD}{SUCCESS}  ==> Waiting for Execution..... {END} ')
    if user_input == '1':
        while True:
            if datetime.now() > datetime.strptime(execution_time, '%Y-%m-%d %H:%M:%S'):
                subprocess.run(f'{extract}',shell=True)
                break
    elif user_input == '2':
        while True:
            if datetime.now() > datetime.strptime(execution_time, '%Y-%m-%d %H:%M:%S'):
                subprocess.run(f'{transform}',shell=True)
                break
    elif user_input == '3':
        while True:
            if datetime.now() > datetime.strptime(execution_time, '%Y-%m-%d %H:%M:%S'):
                subprocess.run(f'{load}',shell=True)
                break
    elif user_input == '4':
        while True:
            if datetime.now() > datetime.strptime(execution_time, '%Y-%m-%d %H:%M:%S'):
                subprocess.run(f'{extract}',shell=True)
                subprocess.run(f'{transform}',shell=True)
                subprocess.run(f'{load}',shell=True)
                break
    else:
        print(f'{FAILURE}[-] Choose from the options : 1,2,3 or 4 !{END}')



def main():
    """
    This function helps to conduct ETL process according to our choice.
    """

    print(f'''{SUCCESS}{BOLD}
       _   _ ____ _    ___     ____ ___ _    
        \_/  |___ |    |__] __ |___  |  |    
         |   |___ |___ |       |___  |  |___ 
                                            {END}
                                      
    {BOLD}Choose ETL Process: 
    1. Extraction  2. Transformation  3. Load 4. All {END}

    ''')
    user_input = input('>> ')
    split_user_input = user_input.split(' ')
        
    try:
        execution_time = split_user_input[2]+' '+split_user_input[3]
        # print(execution_time)
        execute_etl(split_user_input[0],execution_time)
        user_input = split_user_input[0]
        print(user_input)
    except:
        if user_input == '1':
            subprocess.run(f'{extract}',shell=True)
        elif user_input == '2':
            subprocess.run(f'{transform}',shell=True)
        elif user_input == '3':
            subprocess.run(f'{load}',shell=True)
        elif user_input == '4':
            subprocess.run(f'{extract}',shell=True)
            subprocess.run(f'{transform}',shell=True)
            subprocess.run(f'{load}',shell=True)
        else:
            print(f'{FAILURE}[-] Choose from the options : 1,2 or 3 !{END}')

if __name__ == '__main__':
    main()

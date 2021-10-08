import subprocess
from utils.utils import *


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
    1. Extraction  2. Transformation  3. Load {END}

    ''')
    user_input = input('>> ')
    if user_input == '1':
        subprocess.run('python extract_raw_from_json.py',shell=True)
    elif user_input == '2':
        subprocess.run('python transformation.py',shell=True)
    elif user_input == '3':
        subprocess.run('python load.py',shell=True)
    else:
        print(f'{FAILURE}[-] Choose from the options : 1,2 or 3 !{END}')

if __name__ == '__main__':
    main()

from utils.utils import *


def file_content_toString(file_path):
    try:
        with open(file_path, 'r') as file:
            content = "".join(file.readlines())
        return content
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}', e)

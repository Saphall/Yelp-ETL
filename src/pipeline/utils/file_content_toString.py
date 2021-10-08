from utils.utils import *


def file_content_toString(file_path):
    """
    This function provides content of files as string.
    param: file_path: Location of file whose content is needed as string.
    """
    try:
        with open(file_path, 'r') as file:
            content = "".join(file.readlines())
        return content
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}', e)

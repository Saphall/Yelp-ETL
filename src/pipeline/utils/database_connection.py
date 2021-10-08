import os
import psycopg2
from utils.utils import *
from dotenv import load_dotenv

load_dotenv()


def databaseConnect():
    try:
        return psycopg2.connect(
            user=os.environ.get('DATABASE_USER'),
            password=os.environ.get('DATABASE_PASSWORD'),
            host=os.environ.get('HOST'),
            port=os.environ.get('PORT_NUMBER'),
            database=os.environ.get('DATABASE_NAME')
        )
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}', e)


def databaseDisconnect(connection, cursor):
    try:
        connection.close()
        cursor.close()
    except Exception as e:
        print(f'{FAILURE}[-] Exception Occured:{END}', e)

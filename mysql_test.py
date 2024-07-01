import mysql.connector
from mysql.connector import Error, errorcode

# Database configuration object
config = {
    'user': 'root',     
    'password': 'Dominator#749', 
    'host': 'localhost',
    'database': 'movies'
}

try:
    # Establish the connection
    db = mysql.connector.connect(**config)
    print("\n Database user '{user}' connected to MySQL on host '{host}' with database '{database}'".format(
        user=config["user"], 
        host=config["host"], 
        database=config["database"]
    ))

    input("\n\n Press any key to continue...")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print('The supplied username or password are invalid')
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("The specified database does not exist")
    else:
        print(err)

finally:
    if 'db' in locals() and db.is_connected():
        db.close()
        print("MySQL connection is closed")



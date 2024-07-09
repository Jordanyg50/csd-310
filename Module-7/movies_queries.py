import mysql.connector
from mysql.connector import Error, errorcode

# Database configuration object
config = {
    'user': 'root',     
    'password': 'Dominator#749', 
    'host': 'localhost',
    'database': 'movies'
}


def connect_and_query():
    try:
        # Establish the connection
        db = mysql.connector.connect(**config)
        print("\n Database user '{user}' connected to MySQL on host '{host}' with database '{database}'".format(
            user=config["user"], 
            host=config["host"], 
            database=config["database"]
        ))

        cursor = db.cursor()

        # First query: Select all fields from studio table
        cursor.execute("SELECT * FROM studio;")
        studios = cursor.fetchall()
        print("\nStudios:")
        for studio in studios:
            print(studio)

        # Second query: Select all fields from genre table
        cursor.execute("SELECT * FROM genre;")
        genres = cursor.fetchall()
        print("\nGenres:")
        for genre in genres:
            print(genre)

        # Third query: Select movie names with runtime less than 2 hours
        cursor.execute("SELECT movie_name FROM film WHERE runtime < 120;")
        short_movies = cursor.fetchall()
        print("\nMovies with runtime less than 2 hours:")
        for film in short_movies:
            print(film[0])

        # Fourth query: List film names and directors grouped by director
        cursor.execute("SELECT director, GROUP_CONCAT(movie_name SEPARATOR ', ') as films FROM movies GROUP BY director;")
        directors = cursor.fetchall()
        print("\nFilms grouped by director:")
        for director in directors:
            print(f"{director[0]}: {director[1]}")

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

if __name__ == "__main__":
    connect_and_query()

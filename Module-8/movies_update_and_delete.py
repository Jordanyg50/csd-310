import mysql.connector

def show_films(cursor, title):
    # Execute the select statement
    cursor.execute("""
        SELECT film_name AS Name, film_director AS Director, genre_name AS Genre, studio_name AS Studio
        FROM film
        INNER JOIN genre ON film.genre_id = genre.genre_id
        INNER JOIN studio ON film.studio_id = studio.studio_id
    """)
    films = cursor.fetchall()
    
    print("\n", title, "\n")
    for film in films:
        print(f"Name: {film[0]}, Director: {film[1]}, Genre: {film[2]}, Studio: {film[3]}")
    print("\n")

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Dominator#749",
    database="movies"
)

# Create a cursor object
cursor = db.cursor()

# Display initial film records
show_films(cursor, "DISPLAYING FILMS")

# Insert a new record
cursor.execute("""
    INSERT INTO film (film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
    VALUES ('US', 2019, 121, 'Jordan Peele', 2, 1)    
""")
db.commit()
show_films(cursor, "DISPLAYING FILMS AFTER INSERT")

# Update an existing record
cursor.execute("""
    UPDATE film
    SET genre_id = (SELECT genre_id FROM genre WHERE genre_name = 'Horror')
    WHERE film_name = 'Alien'
""")
db.commit()
show_films(cursor, "DISPLAYING FILMS AFTER UPDATE")

# Delete a specific record
cursor.execute("""
    DELETE FROM film
    WHERE film_name = 'Gladiator'
""")
db.commit()
show_films(cursor, "DISPLAYING FILMS AFTER DELETE")

# Close the cursor and connection
cursor.close()
db.close()

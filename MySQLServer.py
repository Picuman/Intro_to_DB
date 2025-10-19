import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server (no database selected yet)
    connection = mysql.connector.connect(
        host='localhost',      # Change if your MySQL is on another host
        user='root',           # Replace with your MySQL username
        password='your_password'  # Replace with your MySQL password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Create the database if it doesn't exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    # Close cursor and connection
    if 'cursor' in locals() and cursor.is_connected() == False:
        cursor.close()
    elif 'cursor' in locals():
        cursor.close()
        
    if 'connection' in locals() and connection.is_connected():
        connection.close()

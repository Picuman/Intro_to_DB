import mysql.connector

mydb = mysql.connector.connect(
  host="your_host",
  user="your_user",
  password="your_password",
  database="alx_book_store"
)

mycursor = mydb.cursor()

# Create tables
sql = """
CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
);
"""
mycursor.execute(sql)

# ... similar code for other tables

mydb.commit()


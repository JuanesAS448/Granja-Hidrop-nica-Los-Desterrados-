import mysql.connector

connection = mysql.connector.connect(host = "localhost", user = "root", passwd = "juanes448")

cursor1 = connection.cursor()

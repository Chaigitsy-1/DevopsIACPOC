import mysql.connector
import os
try:
    from urllib.parse import urlparse
except ImportError:
     from urlparse import urlparse

hostid=os.environ['hostid']
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Helloworld@1",
  database="mysql"

)

cursor=mydb.cursor()


cursor.execute("DROP TABLE IF EXISTS STORE")


sql ='''CREATE TABLE STORE(
   `Key` CHAR(20) NOT NULL,
   Value CHAR(20)
)'''
cursor.execute(sql)

fetchquery='''SELECT * from STORE'''
cursor.execute(fetchquery)
result=cursor.fetchall()
print(result)


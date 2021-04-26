import mysql.connector
import os
#hostid=os.environ['hostid']
mydb = mysql.connector.connect(
  host="localhost",
  user="bala",
  password="Helloworld@1",
  database="mysql"

)

cursor=mydb.cursor()
def append(keys,values):
    query='''INSERT INTO STORE(
   `Key`,Value) VALUES
   (%s, %s)'''
    tuple1=(keys,values)
    result1=cursor.execute(query,tuple1)
    mydb.commit()
    #fetchquery='''SELECT * from STORE'''
    #cursor.execute(fetchquery)
    #result=cursor.fetchall()
    return result1
def showdata():
    fetchquery='''SELECT * from STORE'''
    cursor.execute(fetchquery)
    result=cursor.fetchall()
    return result

#res=append('fiirte','kntr')
##print(res)
res1=showdata()
for i in res1:
#:wq
    print(i)

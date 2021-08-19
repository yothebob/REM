import sqlite3

con = sqlite3.connect("parts_list.db")
cur = con.cursor()

for row in cur.execute(''' SELECT * FROM inventory'''):
    print(row)

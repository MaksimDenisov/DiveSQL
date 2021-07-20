# encoding: utf-8
import psycopg2 as pg_driver

# Postgres, запущенный в докере, не требует пароля, если клиент находится на localhost
hostname = 'localhost'
username = 'user'
password = 'password'
database = 'divesql'

db = pg_driver.connect(host=hostname, user=username, password=password, database=database)
cur = db.cursor()


def fun1(commander_id):
    result = []
    cur.execute("SELECT commander_id, spacecraft_id, start_date FROM Flight")
    for flight in cur.fetchall():
        if flight[0] != commander_id:
            continue
        cur.execute("SELECT id, name FROM Spacecraft")
        for spacecraft in cur.fetchall():
            if spacecraft[0] == flight[1]:
                result.append((spacecraft, flight))  # добавляем в результат пару
    return result


def fun2(commander_id):
    result = []
    for spacecraft, flight in fun1(commander_id):
        cur.execute("SELECT id, name FROM Commander")
        for cmndr in cur.fetchall():
            if cmndr[0] == flight[0]:
                result.append((cmndr[1], spacecraft[1], flight[2]))
    return result


for row in fun2(5):
    print( row[0], row[1], row[2])

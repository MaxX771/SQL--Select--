import sqlalchemy

engine = sqlalchemy.create_engine('postgresql://postgres:02071977@localhost:5432/bd001')
engine

connection = engine.connect()


# 1. Название и год выхода альбомов, вышедших в 2018 году;
# На своё усмотрение сменил год выхода альбома на 1973;
sel = connection.execute(""" SELECT  name, year FROM album
WHERE year = 1973;
""").fetchall()
print("Название и год выхода альбомов, вышедших в 1973 году,-", sel)


# 2.название и продолжительность самого длительного трека;
sel = connection.execute(""" SELECT name,  time FROM song
ORDER BY time  DESC;
""").fetchall()
print('Название и продолжительность самого длительного трека,-', sel[0])


#3.название треков, продолжительность которых не менее 3,5 минуты;
sel = connection.execute(""" SELECT  name, time FROM song
WHERE time  >= 3.5 * 60;
""").fetchall()
print('Название треков, продолжительность которых не менее 3,5 минут:- ', sel)


#4. названия сборников, вышедших в период с 2018 по 2020 год включительно
sel = connection.execute(""" SELECT name, year FROM collection
WHERE year >= 2018 AND  year <= 2020;
""").fetchall()
print('Названия сборников, вышедших в период с 2018 по 2020 год:- ', sel)


#5.исполнители, чье имя состоит из 1 слова;
sel = connection.execute(""" SELECT name FROM artist
WHERE name NOT LIKE '%% %%'
""").fetchall()
print(sel)


#6.название треков, которые содержат слово "мой"/"my".
sel = connection.execute(""" SELECT name FROM song
WHERE name LIKE '%%My%%'
""").fetchall()
print('Название треков, которые содержат слово "мой"/"my":- ',  sel)


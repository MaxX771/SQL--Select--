create table if not exists artist (
   id serial primary key,
   name varchar (40)  unique not null
);

INSERT INTO artist (id, name)
values (1, 'Depeche Mode'), (2, 'Metallica'), (3, 'Aerosmith'), (4, 'Pink Floyd'), (5, 'Guns N Roses'), (6, 'Deep Purple'), (7, 'Bon Jovi'), (8, 'Scorpions');



create table if not exists album (
 id serial primary key,
 name varchar (140)  unique not null,
 year integer
);


INSERT INTO  album (id, name, year)
values (1, 'The Best of Depeche Mode, Vol.1', 1990),  (2, 'Metallica', 1991), (3, 'Tough Love: Best Of The Ballads', 2004),(4, 'THE DARK SIDE OF THE MOON', 1973),
(5, 'Use Your Illusion I', 1992), (6, 'Smoke On The Water', 2006), (7, 'With Love From ... PolyGram 50th Anniversary', 2020), (8, 'Love At First Sting', 1984);


create table if not exists artistalbum (
  id serial primary key,
  album_id integer not null  references album (id),
  artist_id integer not null references artist (id)
); 

insert into artistalbum (id, album_id, artist_id)
values (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 7),
(7, 7, 2),
(8, 8, 3),
(9, 2, 5),
(10, 8, 6),
(11, 7, 5),
(12, 6, 8),
(13, 5, 1),
(14, 4, 2),
(15, 3, 4);


create table if not exists song (
 id serial primary key,
 name varchar (40) unique not null,
 time  integer,
 album_id integer references album (id)
);

INSERT INTO song (id, name, time, album_id)
values (1,'Enjoy the silence', 256, 1), (2, 'Nothing Else Matters', 387, 2), (3, 'Crazy', 316, 3), (4, 'Time', 413, 4), (5, 'November Rain', 556, 5),
(6, 'Smoke on the Water', 447, 6), (7, 'Always', 288, 7), (8, 'Still Loving You', 407, 8), (9, 'Amazing', 356, 3), (10, 'Send Me An Angel', 274, 8),
(11, 'DonТt Cry', 284, 5), (12, 'It"s No Good', 358, 1), (13, 'ItТs My Life', 223, 7), (14,' The Unforgiven', 300, 2), (15, 'Another Brick in the Wall', 232, 4);

create table if not exists genre_of_music (
 id serial primary key,
 name varchar (40) unique not null
);

INSERT INTO genre_of_music (id, name)
  values (1, 'альтернативный рок'), (2, 'хеви-метал'), (3, 'прогрессивный рок'), (4, 'хард-рок'), (5, 'глэм-метал');
 
 create table if not exists artistgener (
  id serial primary key,
  genre_of_music_id  integer not null  references genre_of_music (id),
  artist_id integer  references artist (id)
);                                                                                       

insert into artistgener (id, artist_id, genre_of_music_id)
values (1, 1, 1),
(2, 2, 2),
(3, 4, 3),
(4, 8, 3),
(5, 6, 1),
(6, 8, 1),
(7, 5, 4), 
(8, 7, 4),
(9, 3, 5);

create table if not exists collection  (
	id serial   primary key,
	name varchar (40) unique not null ,
	time  integer,
	year integer
);

INSERT INTO collection (id, name,  time, year)
values (1, 'Name1', 956, 2000),
  (2, 'Name2', 1231, 2010),
  (3, 'Name3', 729, 2015),
  (4, 'Name4',  532, 2001),
  (5, 'Name5',  872, 2008),
  (6, 'Name6',  630, 2018),
  (7, 'Name7',  671,  2008),
  (8, 'Name8', 1103, 2021);
 
                                                                                    

create table if not exists collectionsong (
id serial primary key,
collection_id integer not null  references collection (id),
song_id integer references song (id)
);    


insert into collectionsong  (id, collection_id,  song_id)
values 
	(1, 1, 1),
(2, 1, 3),
(3, 1, 2),
(4, 2, 2),
(5, 2, 5),
(6, 2, 7),
(7, 3, 3),
(8, 3, 4),
(9,  4, 15),
(10, 4, 14),
(11, 5, 11),
(12, 5, 15),
(13, 5, 9),
(14, 6, 13),
(15, 6, 8),
(17, 7, 11),
(18, 7, 2),
(19, 8, 9),
(20, 8, 6),
(21, 8, 14);









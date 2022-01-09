create table if not exists genre (
	genre_id serial primary key,
	name varchar (40) not null
	
);

create table if not exists artist (
	artist_id serial primary key,
	name varchar(40) unique not null,
	genre integer references genre (genre_id)
);

create table if not exists album (
	album_id serial primary key,
	name varchar(100) not null,
	year date not null,
	artist_id integer references artist(artist_id)
);

create table if not exists tracks (
	track_id serial primary key,
	title text not null,
	track_time time,
	album_id integer references album(album_id)

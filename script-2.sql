create table if not exists genre (
	genre_id serial primary key,
	name varchar (40) not null
	
);

create table if not exists artist (
	artist_id serial primary key,
	name varchar(40) unique not null,
	genre integer references genre (genre_id)
);

alter table artist drop column genre;

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
);

create table if not exists collection (
	collection_id serial primary key,
	name varchar (100) not null,
	year date not null,
	track_id integer references tracks(track_id)
);

create table if not exists ArtistGenre (
	id serial primary key,
	artist_id integer not null references artist(artist_id),
	genre_id integer not null references genre(genre_id)
);

create table if not exists ArtistAlbum (
	id serial primary key,
	artist_id integer not null references artist(artist_id),
	album_id integer not null references album (album_id)
);

create table if not exists TrackCollection (
	id serial primary key,
	track_id integer not null references tracks(track_id),
	collection_id integer not null references collection(collection_id)
);

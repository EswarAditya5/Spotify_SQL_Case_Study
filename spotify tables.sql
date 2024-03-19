create database spotify;
use spotify;

-- create employee table
create table employee(
	employee_id int primary key,
    last_name varchar(50),
    first_name varchar(50),
	title char(30),
    report_to int,
    birthdate datetime,
    hire_date datetime,
    address varchar(100),
    city char(20),
    state char(20),
    postal_code varchar(10),
    phone varchar(20),
    fax varchar(20),
    email varchar(50)
);

-- create customer table
create table customer(
	customer_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    company varchar(100),
    address varchar(100),
    city varchar(100),
    state char(10),
    country char(10),
    postal_code varchar(15),
    phone varchar(20),
    fax varchar(20),
    email varchar(50),
    support_rep_id int,
foreign key (support_rep_id) references employee(employee_id)
);

-- create invoice table
create table invoice(
	invoice_id int primary key,
    customer_id int,
    invoice_date datetime,
    billing_address varchar(50),
    billing_city varchar(50),
    billing_state varchar(10),
    billing_country char(10),
    billing_postal_code varchar(20),
	total float,
foreign key(customer_id) references customer(customer_id)
);

-- create artist table
create table artist(
	artist_id int primary key,
    name varchar(100)
);

-- create album table
create table album(
	album_id int primary key,
    title varchar(100),
    artist_id int,
foreign key (artist_id) references artist(artist_id)
);
  
-- create playlist table
create table playlist(
	playlist_id int primary key,
    name varchar(50)
);
 
-- create media type table
 create table media_type(
	media_type_id int primary key,
    name varchar(50)
);

-- create genre table
create table genre(
	genre_id int primary key,
    name varchar(50)
);
  
-- create track table
 create table track(
	track_id int primary key,
    name varchar(200),
    album_id int,
    media_type_id int,
    genre_id int,
    composer varchar(200),
    milliseconds int,
    bytes int,
    unit_price float,
foreign key (album_id) references album(album_id),
foreign key (media_type_id) references media_type(media_type_id),
foreign key (genre_id) references genre(genre_id)
 );

-- create invoice_line table
create table invoice_line(
	invoice_line_id int primary key,
    invoice_id int,
    track_id int,
    unit_price float,
    quantity int,
foreign key (track_id) references track(track_id),
foreign key (invoice_id) references invoice(invoice_id)
);
 
-- create playlist_track table 
create table playlist_track(
	playlist_id int,
	track_id int,
foreign key (playlist_id) references playlist(playlist_id),
foreign key (track_id) references track(track_id)
);

show tables;

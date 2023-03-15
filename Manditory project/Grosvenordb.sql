-- create database Grosvenor; database created
-- use Grosvenor 
-- drop database Grosvenor
-- creating the tables

CREATE TABLE hotel ( 
hotel_no CHAR(4) NOT NULL, 
name VARCHAR(20) NOT NULL, 
address VARCHAR(50) NOT NULL,
PRIMARY KEY (hotel_no)
);


CREATE TABLE room ( 
room_no VARCHAR(4) NOT NULL, 
hotel_no CHAR(4) NOT NULL, 
type CHAR(1) NOT NULL, 
price DECIMAL(5,2) NOT NULL,
FOREIGN KEY(hotel_no) references hotel (hotel_no),
PRIMARY KEY(room_no)
);


CREATE TABLE booking (
hotel_no CHAR(4) NOT NULL, 
room_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL, 
date_from DATE NOT NULL, 
date_to DATETIME NULL,   
FOREIGN KEY(hotel_no) REFERENCES hotel (hotel_no),
FOREIGN KEY(room_no) REFERENCES room (room_no),
PRIMARY KEY(guest_no)
);


CREATE TABLE guest ( 
guest_no CHAR(4) NOT NULL, 
name VARCHAR(20) NOT NULL, 
address VARCHAR(50) NOT NULL,
FOREIGN KEY(guest_no) references booking (guest_no)
);

select * from hotel;
select * from room;
select * from booking;
select * from guest;

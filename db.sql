drop database if exists webshop;
create database webshop;
use webshop;

create table category (
	id int primary key auto_increment,
	name varchar(50) not null
);

create table product (
	id int primary key auto_increment,
	name varchar(100) not null,
	price double(10,2) not null,
	alcohol double(10,2) not null,
	size decimal(6,3),
	image varchar(50),
	info varchar(255),
	category_id int not null,
	index category_id(category_id),
	foreign key (category_id) references category(id) on delete restrict
);

create table customer (
	id int primary key auto_increment,
	firstname varchar(50) not null,
	lastname varchar(50) not null,
	address varchar(50) not null,
	zip varchar(10) not null,
	city varchar(30) not null
);

create table `order` (
	id int primary key auto_increment,
	order_date timestamp default current_timestamp,
	customer_id int not null,
	index customer_id(customer_id),
	foreign key (customer_id) references customer(id)
	on delete restrict
);

create table order_row (
	order_id int not null,
	index order_id(order_id),
	foreign key (order_id) references `order`(id)
	on delete restrict,
	product_id int not null,
	index product_id(product_id),
	foreign key (product_id) references product(id)
	on delete restrict
);

insert into category(name) value ('Tummat oluet');
insert into category(name) value ('Vaaleat oluet');
insert into category(name) value ('Alet');
insert into category(name) value ('Alkoholittomat oluet');

insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team alcohol-free lager', 1.90, 0.0, 0.33, "A-team alcohol-free lager", 'Oljenkeltainen, keskitäyteläinen, keskiasteisesti humaloitu, keksinen, kevyen viljainen, hennon hunajainen', 4);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team alcohol-free pale ale', 2, 0.0, 0.33, "A-team alcohol-free pale ale", 'Kullankeltainen, keskitäyteläinen, keskiasteisesti humaloitu, hedelmäinen, sitruksinen', 4);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team raspberry sour ale', 4.30, 5.7, 0.33, "A-team raspberry sour ale", 'Punertava, samea, keskitäyteläinen, miedosti humaloitu, villivadelmainen, sitruksinen, valkoherukkainen, hapankirsikkainen', 3);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team india pale ale', 3.70, 7.5, 0.33, "A-team india pale ale", 'Meripihkankeltainen, keskitäyteläinen, voimakkaasti humaloitu, havuinen, sitruksinen, hedelmäinen', 3);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team amber lager', 2.50, 4.7, 0.33, "A-team amber lager", 'Meripihkanruskea, runsasvaahtoinen, täyteläinen, keskiasteisesti humaloitu, ruisleipäinen, greippinen, yrttinen', 2);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team summer lager', 2.50, 5.0, 0.33, "A-team summer lager", 'Vaaleankeltainen, kevyt, miedosti humaloitu, viljainen, hennon yrttinen', 2);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team chocolate porter', 4.50, 6.0, 0.33, "A-team chocolate porter", 'Ruskea, täyteläinen, miedosti humaloitu, kaakaoinen, kahvinen, suklainen', 1);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('A-team oatmeal stout', 4.50, 7.5, 0.33, "A-team oatmeal stout", 'Kahvinruskea, samea, täyteläinen, keskiasteisesti humaloitu, paahtomaltainen, suklainen, kahvinen, mausteinen, kevyen pähkinäinen', 1);

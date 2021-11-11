drop database if exists webshop;
create database webshop;
use webshop;

create table category (
	id int primary key auto_increment,
	name varchar(50) not null
);

insert into category(name) value ('Lagerit ja Pilsnerit');
insert into category(name) value ('IPAt, APAt ja NEIPAt');
insert into category(name) value ('Sourit ja Goset');
insert into category(name) value ('Stoutit ja Portterit');

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

insert into product (name, price, alcohol, size, image, info, category_id) values  ('Koff', 2, 4.7, 0.33, "jpeg", 'Hyvä ja halpa', 1);
insert into product (name, price, alcohol, size, image, info, category_id) values  ('Oulu IPA', 2, 7.5, 0.33, "jpeg", 'Vahva ja maistuva', 2);
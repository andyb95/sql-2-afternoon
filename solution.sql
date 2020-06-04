--JOINS
--1
select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

--2
select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c on i.customer_id = c.customer_id;

--3
select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id;

--4
select al.title, ar.name
from album al
join artist ar on al.artist_id = ar.artist_id;

--5
select pt.track_id
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';

--6
select t.name
from track t
join playlist_track pt on pt.track_id = t.track_id
where pt.playlist_id = 5;

--7
select t.name, p.name
from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;

--8
select t.name, al.title
from track t
join album al on t.album_id = al.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternatie & Punk';


--NESTED QUERIES
--1
select * from invoice
where invoice_id in (
  select invoice_id from invoice_line
  where unit_price > 0.99);

--2
select * from playlist_track
where playlist_id in (
  select playlist_id from playlist
  where name = 'Music');

--3
select * from track
where track_id in (
  select track_id from playlist_track
  where playlist_id = 5);

--4
select *
from track
where genre_id in(
  select genre_id from genre
  where name = 'Comedy');

--5
select * from track
where album_id in (
  select album_id from album
  where title = 'Fireball');

--6
select * from track
where album_id in (
  select album_id from album 
  where artist_id in (
    select artist_id from artist
    where name = 'Queen'
    )
  );


--UPDATING ROWS
--1
update customer
set fax = null
where fax is not null;

--2
update customer
set company = 'Self'
where company is null;

--3
update customer
set last_name = 'Thompson'
where first_name = 'Julia'
and last_name = 'Barnett';

--4
update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

--5
update track
set composer = 'The darkness around us'
where genre_id = (
  select genre_id from genre
  where name = 'Metal')
and composer is null;


--GROUP BY
--1
select count(*), g.name
from track t
join genre g on t.genre_id = g.genre_id
group by g.name;

--2
select count(*), g.name
from track t
join genre g on g.genre_id = t.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name;

--3
select ar.name, count(*)
from album al
join artist ar on ar.artist_id = al.artist_id
group by ar.name;


--USE DISTINCT
--1
select distinct composer 
from track;

--2
select distinct billing_postal_code
from invoice;

--3
select distinct company
from customer;


--DELETE ROWS
--1
delete from practice_delete
where type = 'bronze';

--2
delete from practice_delete
where type = 'silver';

--3
delete from practice_delete
where value = 150;


--ECOMMERCE
--1
create table users(
  user_id serial primary key,
  name varchar(40),
  email varchar(40)
);

create table products(
  product_id serial primary key,
  name varchar(50),
  price int
);

create table orders(
  id serial primary key,
  product_id int
);

--2
insert into users(name, email)
values('Tori', 'tm@gmail.com');
insert into users(name, email)
values('Andy', 'ab@gmail.com');
insert into users(name, email)
values('Matt', 'mb@gmail.com');

insert into products (name, price)
values ('desk lamp', 20);
insert into products (name, price)
values ('office desk', 150);
insert into products (name, price)
values ('vacuum', 200);

insert into orders(product_id)
values(1);
insert into orders(product_id)
values(2);
insert into orders(product_id)
values(3);



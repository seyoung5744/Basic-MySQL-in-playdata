select version();
select 
version(), 
current_date;

-- select 조회해줘...  select 컬럼리스트...    from  테이블명..    select sysdate from dual;

select 3+1;

show tables;

CREATE TABLE pet (
name VARCHAR(20),
owner VARCHAR(20),
species VARCHAR(20),
sex CHAR(1),
birth DATE,
death DATE);

desc pet;

show tables;

drop table pet;

insert into pet values ('Fluffy','Harold','cat','f','1999-02-04',null);
insert into pet values ('Claws','Gwen','cat','m','1994-03-17',null),('Buffy','Harold','dog','f','1989-05-13',null);
insert into pet values 
('Fang','Benny','dog','m','1990-08-27',null),
('Bowser','Diane','dog','m','1994-03-17','1995-07-29'),
('Chirpy','Gwen','bird','f','1998-09-11',null);
insert into pet values 
('Whistler','Gwen','bird',null,'1997-12-09',null),
('Slim','Benny','snake','m','1996-04-29',null);

insert into pet (name,owner) values('bnombom','carami'); 
insert into pet (owner,name) values('bnombom','carami'); 
select name,owner,sex from pet;
select * from pet;


create table test(
id int(2),
name varchar(10));

show tables;

insert into test (id, name) values
(1,'abc'),(2,'def'),(3,'ghi');

select * from test;
select * from pet;

select * from pet 
where species = "CAT";

SELECT * FROM pet WHERE birth >= "1998-1-1"; 

select * from pet order by birth desc, name desc;

select * from pet where sex is not null;
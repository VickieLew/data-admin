
--as root
Create group dna_insight;

CREATE USER dna_superuser1 WITH CREATEUSER password 'Qwerty123';
CREATE USER dna_superuser2 WITH CREATEUSER password 'Qwerty123';
CREATE USER dna_normaluser password 'Qwerty123';


alter group dna_insight add user dna_normaluser;



--as dna_superuser1
CREATE SCHEMA realbook;
GRANT USAGE ON SCHEMA realbook TO group dna_insight;
GRANT SELECT ON ALL tables in SCHEMA realbook TO group dna_insight;

CREATE Table realbook.breakdowns (id integer, name varchar(30), type varchar(30), description varchar(30));
insert into realbook.breakdowns values (1, 'location', 'good', 'abcdefg');
insert into realbook.breakdowns values (2, 'device', 'good', 'abcdefg');
insert into realbook.breakdowns values (3, 'gender', 'bad', 'abcdefg');


--no grants given, as dna_normaluser 
select * from realbook.breakdowns -- denied y

--no grants given, as dna_superuser2
select * from realbook.breakdowns -- can select y

--as dna_superuser2 alter default privileges dna_insight group for facebook schema without specifying the user
ALTER DEFAULT PRIVILEGES IN SCHEMA realbook GRANT SELECT ON TABLES TO GROUP dna_insight;


--as dna_superuser1 create new table in facebook schema campaigns
CREATE Table realbook.campaigns (id integer, name varchar(30), type varchar(30), description varchar(30));
insert into realbook.campaigns values (1, 'location', 'good', 'abcdefg');


--defaults in place, as dna_normaluser 
select * from realbook.breakdowns -- denied y
select * from realbook.campaigns -- still denied y

--defaults in place given, as dna_superuser2
select * from realbook.breakdowns -- can select y
select * from realbook.campaigns -- can select y
 

--as dna_superuser1 drop breakdowns in facebook schema
drop table realbook.breakdowns;
select * from realbook.breakdowns --not there

--as dna_superuser1 re-create breakdowns table in facebook schema
CREATE Table realbook.breakdowns (id integer, name varchar(30), type varchar(30), description varchar(30));
insert into realbook.breakdowns values (1, 'location', 'good', 'abcdefg');
insert into realbook.breakdowns values (2, 'device', 'good', 'abcdefg');
insert into realbook.breakdowns values (3, 'gender', 'bad', 'abcdefg');

--defaults in place, as dna_normaluser 
select * from realbook.breakdowns -- denied
select * from realbook.campaigns -- denied

--defaults, as dna_superuser2
select * from realbook.breakdowns -- can select
select * from realbook.campaigns -- can select

--as dna_superuser2 alter default privileges dna_insight group for facebook schema  specifying the user as dna_superuser1
ALTER DEFAULT PRIVILEGES FOR User dna_superuser1 IN SCHEMA realbook GRANT SELECT ON TABLES TO GROUP dna_insight;

--as dna_superuser1 drop and create table in facebook schema 
drop table realbook.breakdowns;
CREATE Table realbook.breakdowns (id integer, name varchar(30), type varchar(30), description varchar(30));
insert into realbook.breakdowns values (1, 'location', 'good', 'abcdefg');



--defaults in place, as dna_normaluser 
select * from realbook.breakdowns -- can select
select * from realbook.campaigns -- still denied

--defaults in place given, as dna_superuser2
select * from realbook.breakdowns -- can select
select * from realbook.campaigns -- can select

--as superuser2 create new table xxx
CREATE Table realbook.xxx (id integer, name varchar(30), type varchar(30), description varchar(30));
insert into realbook.xxx values (1, 'location', 'good', 'abcdefg');
insert into realbook.xxx values (2, 'device', 'good', 'abcdefg');
insert into realbook.xxx values (3, 'gender', 'bad', 'abcdefg');

--defaults in place, as dna_normaluser 
select * from realbook.breakdowns -- can select
select * from realbook.campaigns -- still denied
select * from realbook.xxx  -- can select

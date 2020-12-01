-- databasees 조회
show databases;

-- database 삭제
drop database testdb;

-- 1. database 를 생성 ( testdb)
create database testdb;
-- 2. user를 생성하세요. host가 localhost, % (user명 : testuser  password : testpw )  
create user testuser@'%' identified by 'testpw';
create user testuser@localhost identified by 'testpw';

-- 3. testuser@% , testuser@localhost 에게 권한을 부여해 주세요.   testdb의 모든 권한을 부여해주세요. 
grant all privileges on testdb.* to 'testuser'@'%' with grant option;
grant all privileges on testdb.* to 'testuser'@'localhost' with grant option;

flush privileges;






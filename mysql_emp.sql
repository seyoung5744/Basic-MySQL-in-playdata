CREATE TABLE DEPT (emp
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

select *from emp;

-- emp 테이블에서 부서 변호가 20번 부서이거나 30번 부서인 사원만 보여주세요.
-- 단, 입사일이 빠른 순서로 보여주세요.
select ENAME from emp where DEPTNO = '20' or DEPTNO = '30' order by hiredate;

-- emp 테이블에서 입사연도가 1983년 이후에 입사한 사원의 정보를 보여주세요.
select * from emp where hiredate >= '1983-01-01';

-- emp 테이블에서 커미션을 받는 사원만 보여주세요
select ename from emp where COMM is not null;

-- emp 테이블에서 급여가 2500 미만인 사원 정보만 보여주세요.
-- 단 급여가 많은 순서대로 보여주세요.
select * from emp where SAL < '2500';

-- emp 테이블에서 job이 manager이면서 부서번호가 30번인 사원의 정보를 보여주세요.
-- 단, 급여가 낮은 순서대로 보여주세요.
select * from emp where JOB = 'manager' and DEPTNO = '30' order by sal;

-- 이름에 A가 들어간 사원 출력
select *from emp
where ename like '%A%';

-- 이름 두번째 글자가 A인 사원 출력
select *from emp
where ename like '_A%';

-- 이름 첫번째 글자가 A인 사원
select empno, ename, job from emp
where ename like 'a%';

select count(*) from emp;
select count(empno) from emp;

create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    sex char(1),
    birth date,
    death date);

show tables;
desc pet;

-- DISTINCT 중복행을 제거
select distinct sex from pet;
desc pet;

-- ALIAS 나타날 컬럼에 대한 다른 이름 부여
desc emp;
select empno 사번, ename 이름, sal * 18 as "연봉" from emp;


select * from emp;
select * from emp where ename = trim('   SMITH');


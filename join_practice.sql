select * from emp where deptno = 30; 

select avg(sal), sum(sal) from emp
where deptno = 10; 

select * from emp;
select * from emp where sal > 1500;

select count(*), sum(sal), avg(sal) from emp where job = 'salesman';

-- group by 절에서는 그룹함수 이외에 컬럼을 group by절에 사용된 컬럼이 아니면 추가 할 수 없다.
select job, count(*), sum(sal), avg(sal) from emp group by job;

select deptno, count(*), sum(sal), avg(sal) from emp group by deptno;

select job, ename, count(*), sum(sal), avg(sal) from emp group by job having count(*) > 2;

select job, ename, count(*), sum(sal), avg(sal) 
from emp 
where sal > 1000 group by job
having avg(sal) > 1300 and avg(sal) < 4000
order by 4 desc;

--  현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select job 직책, count(*), avg(sal) as '평균연봉' 
from emp 
group by job having count(*) > 100;

-- 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
select job, avg(sal) from emp where job = 'Engineer' group by job;

select * from emp;

-- 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
-- 단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
-- 대해서 내림차순(DESC)로 정렬하세요.
select job, sum(sal) as '급여 총합' 
from emp 
where job != 'Engineer'
group by 직책
having sum(sal) > 2000000000
order by sum(sal) desc;

select * from emp;

-- 잘못된 join
-- join 조건을 제대로 부여하지 않으면, 각 테이블 * 테이블 한것 만큼 결과를 얻는다.
select empno,ename, job, dname
from emp, dept;

select empno, ename, job, dname
from emp, dept
where emp.deptno = dept.deptno; -- join조건!!

-- 두개의 테이블에 같은 이름의 컬럼이 존재 한다면 ... 어떤 테이블 컬럼인지 명시해야함.
select empno, ename, job, dname, deptno
from emp e, dept d
where emp.deptno = dept.deptno; 

select e.empno, e.ename, e.job, d.dname, e.deptno
from emp e, dept d -- 코드의 가동성을 위해 별칭을 이용
where e.deptno = d.deptno; 

-- 사원의 사번, 이름, 직책, 부서명을 조회하세요. 단 직책이 manager인 사원을 제외.
select e.empno, e.ename, e.job, d.dname, e.deptno
from emp e, dept d -- 코드의 가동성을 위해 별칭을 이용
where e.deptno = d.deptno
and job!='manager';

-- 부서별, 평균급여와 직원수, 부서번호, 부서명을 조회. 단 직책이 manager인 사원을 제외.
select e.empno, count(*), d.dname, avg(sal)
from emp e, dept d
where e.deptno = d.deptno
group by d.dname, d.deptno;

-- 조인
select count(*) from emp;
desc emp;

insert into emp values(1111, 'kang', 'test', null, null, 2000, null, null);
commit; 

select e.empno, e.ename, e.job, d.dname, e.deptno
from emp e natural join dept d; -- 두 테이블을 알아서 자연스럽게 join해봐~라는 새로운 문법
								-- 두 테이블 상에 똑같은 이름의 컬럼이 하나만 존재할 때 사용가능.
                                
select e.empno, e.ename, e.job, d.dname, e.deptno
from emp e join dept d using(deptno); -- join 조건으로 이용될 컬럼이 두 테이블에서 이름이 동일할 때만 이용 가능.

select e.empno, e.ename, e.job, d.dname, e.deptno
from emp e join dept d on e.deptno = d.deptno;

select * from emp;
select * from dept;

-- outter join
-- right outer join : 두 개의 테이블 중 오른쪽 테이블에서 join 조건에 매핑되지 않았지만 존재하는 것을 모두 보여줌
select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e right outer join dept d on e.deptno = d.deptno; 

select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e left outer join dept d on e.deptno = d.deptno; 

-- 두개의 left, right join 결합
select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e right outer join dept d on e.deptno = d.deptno
union
select e.empno, e.ename, e.job, d.dname, d.deptno
from emp e left outer join dept d on e.deptno = d.deptno; 


-- Non-Equi join
show tables;
desc salgrade;
select * from salgrade; -- emp 랑 연결점이 없는 테이블


-- 사원의 연봉 등급을 알고 싶음.
select * from emp;

select ename, sal, grade
from emp, salgrade
where sal between LOSAL and HISAL;

select * from salgrade;

delete from salgrade;

-- self join
select * from emp;

select e.empno 사번, e.ename 사원이름, m.empno 매니저라번, m.ename 매니저이름
from emp e, emp m
where e.MGR = m.empno;


-- Scott 라는 사원이 근무하고 있는 부서의 평균 급여를 알고 싶다.
select deptno from emp
where ename = "Scott";

select avg(sal) from emp
where deptno = 20;

select avg(sal) from emp
where deptno = (select deptno from emp where ename = "Scott");

-- 평균 급여보다 많이 받는 사원들의 정보 추출
select ename, sal from emp
where sal > (select avg(sal) from emp);


select * from emp 
where deptno = (select deptno from dept where dname = 'RESEARCH');

select * from emp
where mgr =(select mgr from emp where ename = 'smith') ;

select avg(sal) from emp group by deptno;

-- in, any(중에 하나만 만족하면 ok), all(모두 만족하면 ok)
-- 서브쿼리의 결과 값이 여러 개일 때
select * from emp
where sal in (select min(sal) from emp group by deptno);

select * from emp
where sal =any (select min(sal) from emp group by deptno);

select * from emp
where sal >any (select min(sal) from emp group by deptno);
-- sal > 10번 부서의 최소급여보다 크거나, 20번수터의 최소급여보다 크거나, 30번 부서의 최소급여보다 크거나...
-- sal > 10번 부서최소 급여 or sal > 20 부서의 최소급여 or ...

select * from emp
where sal >all (select min(sal) from emp group by deptno);
-- sal > 10번 부서최소 급여 and sal > 20 부서의 최소급여 and ...




select * from emp
where deptno in (10, 20);

-- 등호랑 같이 써야함.
select * from emp
where deptno =any (10, 20);







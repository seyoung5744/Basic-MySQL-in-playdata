-- 사원 테이블의 모든 레코드를 조회하시오.
select * from emp;
-- 사원명과 입사일을 조회하시오.
select ename as '사원명', hiredate as '입사일' from emp;
-- 사원번호와 이름을 조회하시오.
select empno as '사원번호', ename as '이름' from emp;
-- 사원테이블에 있는 직책의 목록을 조회하시오.
select job from emp;
-- 총 사원수를 구하시오.
select count(*) from emp;
-- WHERE 조건
-- 부서번호가 10인 사원을 조회하시오.
select * from emp where deptno = 10;
-- 월급여가 2500이상 되는 사원을 조회하시오.
select * from emp where sal >= 2500;
-- 이름이 'KING'인 사원을 조회하시오.
select * from emp where ename = 'king';
-- 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오.
select ename, empno from emp where ename like 's%';
-- 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오.
select ename, empno from emp where ename like '%t%';
-- 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오
select ename, empno, comm from emp where comm = 300 or comm = 500 or comm = 1400;

-- 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오.
select empno, ename, sal from emp where sal > 1200 and sal < 3500;

-- 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.
select ename, empno, job, deptno from emp where job = 'manager' and deptno = 30;

-- 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오.
select empno, ename, deptno from emp where deptno != 30;

-- 출 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오.
select empno, ename, comm from emp where comm not in (300, 500, 1400);
-- 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오.
select empno, ename from emp where ename not like "%s%";

-- 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오.
select empno, ename, sal from emp where sal not between 1200 and 3700;

-- 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오.
select ename, job from emp where mgr is null;

-- GROUP BY 구문
-- 부서별 평균월급여를 구하는 쿼리
select deptno, avg(sal) from emp group by deptno;

-- 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리
select deptno as 부서, count(*), comm from emp group by deptno;

-- 부서별 최대 급여와 최소 급여를 구하는 쿼리
select deptno as 부서, min(sal) as 최소급여, max(sal) as 최대급여 from emp group by deptno;

-- 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만)
select deptno, avg(sal) from emp group by deptno having avg(sal) > 2000;

-- 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라.
select deptno, avg(sal) from emp where sal > 1000 group by deptno having avg(sal) > 2000;

-- ORDER BY 구문
-- 급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 철자가 빠른 사원순으로 사번,이름,월급여를 조회하시오.
select * from emp;
select empno, ename, sal from emp order by sal, ename asc;

-- 조인
-- 카테시안 곱
select e.ename, d.dname from emp e, dept d;

-- 사원명과 부서명을 조회하시오.
select * from dept;
select emp.ename, dept.dname from emp, dept;

-- 이름,월급여,월급여등급을 조회하시오.
select e.ename, e.sal, s.grade from emp e, salgrade s where e.sal between s.LOSAL and s.HISAL;

-- 이름,부서명,월급여등급을 조회하시오.
select e.ename, d.dname, s.grade from emp e, dept d, salgrade s 
where e.DEPTNO = d.DEPTNO
and e.sal between s.LOSAL and s.HISAL;

-- 이름,직속상사이름을 조회하시오.
select * from emp;
select e.ename, ee.ename from emp e, emp ee where e.empno = ee.mgr;
select e.ename, ee.ename FROM EMP E left outer join EMP ee ON E.MGR = ee.EMPNO;

-- 이름,부서명을 조회하시오.단, 사원테이블에 부서번호가 40에 속한 사원이 없지만 부서번호 40인 부서명도 출력되도록 하시오.
select e.ename, d.dname, d.DEPTNO from dept d left outer join emp e on d.DEPTNO = e.DEPTNO;

-- 이름,부서번호,부서이름을 조회하시오.
select e.ename, d.dname, e.deptno from emp e, dept d where e.deptno = d.deptno;
select e.ename, d.dname, e.deptno from emp e inner join dept d on d.DEPTNO = e.DEPTNO;

-- 부서번호가 30번인 사원들의 이름, 직급, 부서번호, 부서위치를 조회하시오.
select e.ename, d.dname, d.deptno, d.loc from emp e, dept d where e.DEPTNO = d.DEPTNO and d.deptno = 30;
select e.ename, d.dname, d.deptno, d.loc from emp e inner join dept d on e.DEPTNO = d.DEPTNO where d.deptno = 30;

-- 커미션을 받는 사원의 이름, 커미션, 부서이름,부서위치를 조회하시오.
select e.ename, e.comm, d.dname, d.loc from emp e inner join dept d on e.DEPTNO = d.DEPTNO where e.COMM is not null and e.comm <> 0;

-- DALLAS에서 근무하는 사원의 이름,직급,부서번호,부서명을 조회하시오.
select e.ename, e.job, e.deptno, d.dname from emp e inner join dept d on e.DEPTNO = d.DEPTNO where d.loc = "DALLAS";

-- 이름에 A 가 들어가는 사원의 이름,부서명을 조회하시오.
select e.ename, d.dname from emp e, dept d where e.DEPTNO = d.DEPTNO and e.ename like "%a%";

-- 이름, 직급, 월급여, 월급여등급을 조회하시오.
select e.ename, e.job, e.sal, s.grade from emp e, salgrade s where e.sal between s.LOSAL and s.HISAL;

-- ALLEN과 같은 부서에 근무하는 사원의 이름, 부서번호를 조회하시오.
select * from emp;

select e.ename, e.deptno from emp e, emp m where e.EMPNO <> m.EMPNO and e.DEPTNO = m.DEPTNO and m.ENAME = 'allen';
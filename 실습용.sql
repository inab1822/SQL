SELECT * FROM TAB;

--SELECT 문
--SELECT [열의이름]
--FROM [테이블 이름]
--[WHERE 조건식]
--[ORDER BY 열 이름]
--대소문자 구분안하고 한줄로써도되고 여러줄로써도된다
--들여쓰기 깐깐하지 않음(하지만 하자)
-- 줄바꿀때가 아닌 명령어의 마지막에는 무조건 ; 을 써야한다.
--
--SELECT *
--FROM employees A --구성요소들은 소문자로하는 관습이있다.
--    {
--        SELECT*
--        FROM departments
--        WHERE department_id = 20
--    }
--WHERE A.department_id = B.department_id;


-- employees 테이블에 있는 모든 열을 조회하라
select *
FROM employees;

select employee_id, first_name, last_name
FROM employees;
--
SELECT department_id, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- ORDER BY <컬럼명> 순서대로 정렬 (DESC = 역순)
SELECT employee_id, FIRST_NAME
FROM employees
ORDER BY first_name;

-- 중복된  출력값 제거
SELECT DISTINCT job_id
FROM employees;

-- 별칭 더하기 AS(alias의 약자) 접속사
SELECT employee_id AS "직원 번호", first_name AS 성, last_name AS 이름
FROM employees;

select location_id as 지역번호, country_id as 나라번호, city as 도시
from locations;

select department_name
from departments;

-- 데이터값 연결하기 연산자 
SELECT employee_id, FIRST_NAME||last_name
FROM employees
ORDER BY first_name;

-- 연결된 데이터값 사이 띄워주기
SELECT employee_id, FIRST_NAME||'가문의 '||last_name||'씨'
FROM employees
ORDER BY first_name;

-- 이메일 주소를 채워주세요. email@company.com
select email||'@company.com' as EMAIL
from employees;

-- 산술연산 가능 + - * / ()
SELECT employee_id, SALARY, SALARY*1.1, SALARY+500, (SALARY+100)/100, salary||00/10
FROM employees;

-- WHERE절 조건
--SELECT 열이름
--FROM 테이블 이름
--WHERE 조건 CONDITION;

-- employee_id 가 100인 사람의 정보 조회
SELECT *
FROM employees
WHERE employee_id = 100;

-- 성이 david인 사람만 조회

select *
from employees
where first_name = 'David';

select *
from employees
where employee_id >= 105 and first_name = 'David';

-- 급여가 10000이상인 사람만 조회
select *
from employees
where salary >= 10000;

-- 조건문 확장 between a and b
select *
from employees
where salary  BETWEEN 1000 AND 15000; 


-- 조건문 확장 in : 어느 값이라도 일치하는 것 반환
select *
from employees
where salary  IN (10000,20000,17000);

-- 조건문 확장 LIKE
SELECT*
FROM employees
WHERE JOB_ID LIKE 'AD%'; -- % 는 모든 문자를 뜻함 (AD로 시작하는 모든 문자), (% 같은 문자를 WILD CARK라고한다)

-- JOB_ID 가 MAN으로 끝나는 직원을 모두 조회
SELECT*
FROM EMPLOYEES
WHERE job_id LIKE '%MAN';


-- IS NULL : 데이터 값이 NULL인 경우를 조회
SELECT*
FROM employees
WHERE manager_id IS NULL;

-- AND 두가지 조건 모두 만족, OR 한가지 조건만 만족
SELECT*
FROM EMPLOYEES
WHERE SALARY > 5000
AND JOB_ID = 'IT_PROG';


SELECT*
FROM EMPLOYEES
WHERE SALARY > 5000
AND JOB_ID = 'IT_PROG'
OR JOB_ID = 'FI_ACCOUNT';

-- <> 같지 않다. NOT,   !=
SELECT*
FROM EMPLOYEES
WHERE employee_id <> 100;

SELECT*
FROM employees
WHERE employee_id != 100;

SELECT*
FROM employees
WHERE NOT employee_id = 100;

SELECT*
FROM employees;

-- group by 데이터 값을 기준으로 하나의 열로 그룹화하여 함수 적용
SELECT job_id 직무, SUM(salary) 직무별_급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
group by job_id
order by 직무별_급여 desc;

-- group by having 조건식
--select 열 이름
--from 테이블 이름
--where 조건식
--group by 기준이 되는 열이름
--having 조건식
--order by 열 이름;

SELECT job_id 직무, SUM(salary) 직무별_급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
group by job_id
having sum(salary) > 30000
Order By 직무별_급여 Desc;

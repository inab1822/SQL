SELECT * FROM TAB;

--SELECT ��
--SELECT [�����̸�]
--FROM [���̺� �̸�]
--[WHERE ���ǽ�]
--[ORDER BY �� �̸�]
--��ҹ��� ���о��ϰ� ���ٷνᵵ�ǰ� �����ٷνᵵ�ȴ�
--�鿩���� ������� ����(������ ����)
-- �ٹٲܶ��� �ƴ� ��ɾ��� ���������� ������ ; �� ����Ѵ�.
--
--SELECT *
--FROM employees A --������ҵ��� �ҹ��ڷ��ϴ� �������ִ�.
--    {
--        SELECT*
--        FROM departments
--        WHERE department_id = 20
--    }
--WHERE A.department_id = B.department_id;


-- employees ���̺� �ִ� ��� ���� ��ȸ�϶�
select *
FROM employees;

select employee_id, first_name, last_name
FROM employees;
--
SELECT department_id, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- ORDER BY <�÷���> ������� ���� (DESC = ����)
SELECT employee_id, FIRST_NAME
FROM employees
ORDER BY first_name;

-- �ߺ���  ��°� ����
SELECT DISTINCT job_id
FROM employees;

-- ��Ī ���ϱ� AS(alias�� ����) ���ӻ�
SELECT employee_id AS "���� ��ȣ", first_name AS ��, last_name AS �̸�
FROM employees;

select location_id as ������ȣ, country_id as �����ȣ, city as ����
from locations;

select department_name
from departments;

-- �����Ͱ� �����ϱ� ������ 
SELECT employee_id, FIRST_NAME||last_name
FROM employees
ORDER BY first_name;

-- ����� �����Ͱ� ���� ����ֱ�
SELECT employee_id, FIRST_NAME||'������ '||last_name||'��'
FROM employees
ORDER BY first_name;

-- �̸��� �ּҸ� ä���ּ���. email@company.com
select email||'@company.com' as EMAIL
from employees;

-- ������� ���� + - * / ()
SELECT employee_id, SALARY, SALARY*1.1, SALARY+500, (SALARY+100)/100, salary||00/10
FROM employees;

-- WHERE�� ����
--SELECT ���̸�
--FROM ���̺� �̸�
--WHERE ���� CONDITION;

-- employee_id �� 100�� ����� ���� ��ȸ
SELECT *
FROM employees
WHERE employee_id = 100;

-- ���� david�� ����� ��ȸ

select *
from employees
where first_name = 'David';

select *
from employees
where employee_id >= 105 and first_name = 'David';

-- �޿��� 10000�̻��� ����� ��ȸ
select *
from employees
where salary >= 10000;

-- ���ǹ� Ȯ�� between a and b
select *
from employees
where salary  BETWEEN 1000 AND 15000; 


-- ���ǹ� Ȯ�� in : ��� ���̶� ��ġ�ϴ� �� ��ȯ
select *
from employees
where salary  IN (10000,20000,17000);

-- ���ǹ� Ȯ�� LIKE
SELECT*
FROM employees
WHERE JOB_ID LIKE 'AD%'; -- % �� ��� ���ڸ� ���� (AD�� �����ϴ� ��� ����), (% ���� ���ڸ� WILD CARK����Ѵ�)

-- JOB_ID �� MAN���� ������ ������ ��� ��ȸ
SELECT*
FROM EMPLOYEES
WHERE job_id LIKE '%MAN';


-- IS NULL : ������ ���� NULL�� ��츦 ��ȸ
SELECT*
FROM employees
WHERE manager_id IS NULL;

-- AND �ΰ��� ���� ��� ����, OR �Ѱ��� ���Ǹ� ����
SELECT*
FROM EMPLOYEES
WHERE SALARY > 5000
AND JOB_ID = 'IT_PROG';


SELECT*
FROM EMPLOYEES
WHERE SALARY > 5000
AND JOB_ID = 'IT_PROG'
OR JOB_ID = 'FI_ACCOUNT';

-- <> ���� �ʴ�. NOT,   !=
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

-- group by ������ ���� �������� �ϳ��� ���� �׷�ȭ�Ͽ� �Լ� ����
SELECT job_id ����, SUM(salary) ������_�޿�, AVG(salary) ������_��ձ޿�
FROM employees
WHERE employee_id >= 10
group by job_id
order by ������_�޿� desc;

-- group by having ���ǽ�
--select �� �̸�
--from ���̺� �̸�
--where ���ǽ�
--group by ������ �Ǵ� ���̸�
--having ���ǽ�
--order by �� �̸�;

SELECT job_id ����, SUM(salary) ������_�޿�, AVG(salary) ������_��ձ޿�
FROM employees
WHERE employee_id >= 10
group by job_id
having sum(salary) > 30000
Order By ������_�޿� Desc;

-- Recursive CTE

-- Syntax
/*
With Recursive cte_name As (
	CTE_query_defination  -- non recursive term --> Base member
    UNION ALL
	recursive_qeury_defination -- Recursive term --> recursive member
) select * from cte_name

*/
-- Example
with Recursive mycte as (
	select 1 AS n                  -- base qeury
     Union all
     select n+2 from mycte         -- recursive qeury
     where n<10                     -- condition check
)
select * from mycte;


/*  Applications of Recursive CTE 
	1. Count up until certain value.
    2. Finding Bosses and Hierarchical level for all employee
    3. Finding Routes Between Cities
    4. Finding Ancestors.
*/
create database prepare;
use prepare;

-- USE CASE EXAMPLE

create table employees (
	emp_id int primary key,
    emp_name varchar(20) not null,
    manager_id int
);

insert into employees (	emp_id,emp_name,manager_id) 
	values 
    (1, 'Thomas',9),
    (2,'John',3),
    (3,'Philips',6),
    (4,'Abe',1),
    (5,'George',2),
    (6,'Niki',10),
    (7,'Joseph',4),
    (8,'Poran',5),
    (9,'Vicky',8),
     (10,'Tom',Null);


select * from prepare.employees;

with recursive emp_mgr_cte as (
	Select emp_id, emp_name,manager_id from 
    employees 
    where emp_id=1
	union all
select employees.emp_id,employees.emp_name,employees.manager_id from employees 
	join emp_mgr_cte
    on employees.emp_id = emp_mgr_cte.manager_id
)select * from emp_mgr_cte;

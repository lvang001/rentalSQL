/*Q1*/
insert into rental_records (veh_reg_no, customer_id, start_date, end_date)
values('SBA1111A', (SELECT customer_id FROM customers WHERE name = 'Angel'), curdate(), date_add(curdate(), interval 10 day));

*Q2*/
insert into rental_records (veh_reg_no, customer_id, start_date, end_date)
values ('GA5555E', (select customer_id from customers where name = 'Kumar'), 
date_add(curdate(), interval 1 day), 
date_add(date_add(curdate(), interval 1 day), interval 3 month));

/*Q3*/
select start_date, end_date, veh_reg_no, brand, name
from rental_records join customers using (customer_id) join vehicles using (veh_reg_no)
order by category, start_date;

/*Q4*/
select * from rental_records where end_date < curdate();

/*Q5*/
select veh_reg_no, name, start_date, end_date from rental_records inner join customers using (customer_id) where start_date < '2012-01-10' and end_date > '2012-01-10';

/*Q6*/
select distinct veh_reg_no, name, start_date, end_date from rental_records inner join customers using (customer_id) where start_date <= curdate();

/*Q7*/
select veh_reg_no, name, start_date, end_date from customers join rental_records using (customer_id) where (start_date >= '2012-01-03' and start_date <= '2012-01-18') or (end_date >= '2012-01-03' and end_date <= '2012-01-18')or (start_date <= '2012-01-03' and end_date >= '2012-01-18');

/*Q8*/
select veh_reg_no, brand, vehicles.desc from vehicles left join rental_records using (veh_reg_no) where veh_reg_no not in (select veh_reg_no from rental_records where start_date < '2012-01-10' and end_date > '2012-01-10');

/*Q9*/
select veh_reg_no, brand, vehicles.desc from vehicles join rental_records using (veh_reg_no)
where not ((start_date >= '2012-01-03' and start_date <= '2012-01-18') or (end_date >= '2012-01-03' and end_date <= '2012-01-18') or (start_date <= '2012-01-03' and end_date >= '2012-01-18'));
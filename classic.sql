create database classicmodels;
 use classicmodels;
select * from customers;
select customerName,creditLimit from customers  order by creditLimit desc limit 2;
select customerName,creditLimit from customers  order by creditLimit desc limit 2,1;  -- only third position     (2+1)
select customerName,creditLimit from customers  order by creditLimit desc limit 4,2; -- total 6 mai se upr k 4 hata do last 2 out of 6   --2 is offset
-- find customers that starts with a
select customername from customers where customername like 'a%';
select customername from customers where customername like '%mini%';
select max(creditlimit),
	   min(creditlimit),
       count(creditlimit) ,
       avg(creditlimit) ,
       sum(creditlimit) 
       from customers;
select customerName,creditLimit from customers 
where creditLimit between 20000 and 30000 ;
select firstName,city from offices join employees on offices.officeCode=employees.officeCode;

select customers.customerName,payments.paymentDate,payments.amount from customers inner join payments 
on customers.customerNumber =payments.customerNumber;
 -- write a query to find out those products whivh is having sum quantity product 
SELECT 
    orderdetails.quantityOrdered, products.productName
FROM
    products
        INNER JOIN
    orderdetails ON products.productCode = orderdetails.productCode;
    
    use classicmodels;
    desc customers;     -- mul = foregin key   gives data type
    
    select customers.customerName,employees.firstName from customers inner join employees on employees.employeeNumber = customers.salesRepEmployeeNumber;
    
    -- list the order detail product name price quantity ordered 
    select products.productName,orderdetails.orderNumber, orderdetails.priceEach,orderdetails.quantityOrdered 
    from orderdetails inner join products on products.productCode = orderdetails.productCode; 
    
 -- show all order whos status is in process with their customer contact name
 select*from orders;
 select orders.status,customers.customerName from customers inner join orders 
 on customers.customerNumber=orders.customerNumber where status = 'in process';
 
 select c.customerName,p.paymentDate,p.amount from customers c
 inner join payments p on c.customerNumber= p.paymentDate;
 
 -- as -- not use in this case  because as changes the name 
 
 -- SELECT customer name , country where country is france , usa or norway 
 
 -- when more then one filter are there aftre when use       IN or NOT IN 
 select customerName , country from customers where country IN ('USA','Norway','France');
 select * from customers;
  -- show all the products that have been ordered ;
  
  -- left join 
select p.productCode ,p.productname from  products p left join orderdetails o 
on  o.productCode = p.productCode where o.productCode is null ;

-- show customers that have never paid 
select c.customerName , p.paymentdate from customers c 
left join payments p on c.customerNumber = p.customerNumber
 where p.customerNumber is null ; -- avoid using paymnetdat is null 
    
    -- show all the products that have been ordered along with the quantity ordered 
    
    select p.productname , sum(od.quantityOrdered) --   sum automatically filters out null , 
    from orderdetails od inner join products p on 
    p.productCode = od.productCode              --  where od.quantityOrdered  is not null 
    group by p.productname ;    
    
    select customername , country from customers where country not in ('usa','france');
    
    select customername , creditlimit from customers limit 5;
    
    select max(creditlimit) as max_creditlimit ,
    min(creditlimit) as min ,
    avg(creditlimit) as avg,
    count(creditlimit) as count,
    sum(creditlimit) as sum
    from customers;   
    
    select c.customername ,e.firstname from customers c inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber;
-- list the productname and product line from each category     
    select p.productname , pl.productline from products  p 
    inner join  productlines pl     -- this provide common information 
    on pl.productLine=p.productLine;
    
    -- where as this gives every information
    select productname , productline from products;   -- avoid using this one
    -- show all order details with product name quantity price 
    
    select p.productname , od.quantityordered,od.ordernumber ,od.priceeach from orderdetails  od 
    inner join  products p on od.productcode  = p.productCode;
   
   -- list all the orders numbers order date and customer names
   select c.customername , o.orderdate ,o.ordernumber from customers c
   inner join orders o on c.customerNumber=o.customerNumber;
 -- show all employes and office city 
 
 select e.firstname , o.city from offices o inner join employees e
 on e.officeCode=o.officeCode;
    
    -- list all the product name quanty ordered and customer name who ordered 
    
    select c.customername , p.productname ,od.quantityordered
    from orderdetails od  
    inner join products p on od.productCode=p.productCode           -- how to use join 3 time at once 
    inner join  orders o on     o.ordernumber = od.ordernumber
 inner join 
	customers c on o.customerNumber=c.customerNumber;
-- list all the orders   with   customer name order status and salesrepname
    
    select c.customername,o.status ,e.firstname ,o.ordernumber  from customers c 
    inner join orders o on o.customerNumber=c.customerNumber
    inner join employees e on c.salesrepemployeenumber=e.employeenumber;
    
    -- how many orders have been placed by herkku gifts 
    select c.customername ,sum(od.quantityOrdered) from customers c 
    inner join orders o 
    on c.customernumber=o.customernumber 
    inner join orderdetails od on od.orderNumber=o.orderNumber
    where customername = 'herkku gifts'
    group by c.customerName;
    -- error is we dont use where or( group by ) use it    because sum gives only one out put 
    -- group by so all the name of customer combines 
    
    -- list all the products that have never been ordered 
    
    select p.productname,od.quantityOrdered
    from products p left join orderdetails od
    on p.productCode=od.productCode
    where quantityOrdered is null ;
    
    -- list all the customers that have never paid 
    select c.customername ,p.amount from
    customers c left join
    payments p on p.customerNumber=c.customerNumber
    where amount is null ;
    
    -- what is the quantiy on hand for products listed in on hold orders 
    
  --  select count(status )from orders where status = 'on hold ' 
   --  group by status ;
    
     select status from orders where trim(status) = 'on hold' ;
    
    select p.productname , p.quantityinstock,o.status 
    from products p inner join orderdetails od 
    on p.productCode=od.productCode 
    inner join orders o 
    on o.orderNumber=od.orderNumber
    where o.status ='on hold'
    order by p.quantityInStock desc;
    
    select * from orders limit 5;
    
    -- select order on monday 
    
    select dayname(orderdate) from orders limit 5;
    
    -- list all the products that have been sold on monday
     
     select ordernumber , orderdate from orders where dayname(orderdate) = 'monday';
    
    -- list all the customres and there orders including customer without orders and order with out customers 
    -- fULL OUTTER JOIN (in microsoft only)  when it says include 
    -- so use left join and right join using union
    
    select c.customernumber,c.customername,o.ordernumber ,o.status 
    from customers c left join orders o 
    on c.customerNumber = o.customerNumber
    union 
    select c.customernumber,c.customername,o.ordernumber ,o.status 
    from customers c right  join orders o 
    on c.customerNumber = o.customerNumber;
    
    -- list all the products and there order detailincluding (unmached product and orders )
--  select o.ordernumber ,p.productname from products p left join orders o 
-- on
 -- union
    -- select o.ordernumber ,p.productname from products p left join orders o 
  -- on 
    
    -- find the employe and there direct managers 
  select e1.employeenumber  as emp_no 
  ,e1.firstname  as emp_name 
  ,m.employeenumber as manager_id,
  m.firstname as manager_name 
  from employees e1 left join employees m 
  on e1.reportsto = m.employeenumber;
    
    select employeenumber,firstname , reportsto from employees limit 5;
    
    -- find the employees who share the same manager 
    
    select e1.employeeNumber as emp_id ,
    e1.firstName as emp_name,
    m.employeeNumber as manager_id ,
    m.firstName as manager_name ,
    e1.reportsTo
    from employees e1 inner join  employees m
    on e1.reportsTo=m.reportsTo
    where e1.employeeNumber <> m.employeeNumber;
    
    -- <> not equal greater and less then
  -- find the product with same price
  select p1.productcode,p1.productname,
  p2.productcode,p2.productname,p1.buyprice 
  from products p1 inner join products p2
  on p1.buyPrice=p2.buyPrice
  where p1.productCode<>p2.productCode;
    
    --  find  employee who work in the same office 
    select firstname ,officecode from employees order by officecode ; -- mine 
    select e1.employeenumber,e1.firstname,
    e2 .employeenumber,e2.firstname,e1.officecode 
    from  employees e1 inner join employees e2 
    on e1.officeCode=e2.officeCode
    where e1.employeeNumber<>e2.employeeNumber;
    -- order by   e1.officecode ;
    
    -- list all customers  from the same country 
    
    select c1.customername,c2.country ,c1.customernumber
    ,c2.customerName,c2.customerNumber
    from customers c1
    inner join customers c2 
    on c1.country=c2.country 
    where c1.customerNumber  <> c2.customerNumber;
    
    -- find the empolyee who have same job title 
 select e1.employeenumber,e1.jobtitle,e1.firstname,
 e2.employeenumber,e2.jobtitle,e2.firstname 
 from employees e1 inner join employees e2 
 on e1.jobTitle=e2.jobTitle
 where e1.employeeNumber <> e2.employeeNumber;
    
  -- find the customers whos place order on the same day 
  select o1.ordernumber,o1.orderdate ,c.customername ,o2.customernumber ,
  o2.ordernumber,o2.orderdate from orders o1 inner join orders o2 
  on o1.orderdate  = o2.orderDate 
  join customers c on c.customerNumber=o1.customerNumber
  where o1.orderNumber <>o2.orderNumber;
    -- mine Flawed. It checks o1.orderNumber <> o2.orderNumber. If the same customer places 
    -- two different orders on the same day, they will match with themselves.
    
    select o1.customernumber ,c1.customername,o1.orderdate,
    o2.customernumber,c2.customername 
    from orders o1
    inner join orders o2 on o1.orderDate = o2.orderDate  and o1.customerNumber<> o2.customerNumber
    inner join customers c1  on o1.customerNumber = c1.customerNumber
    inner join customers c2 on  o2.customerNumber = c2.customerNumber  ;   
    
    -- find the customers who have made same payment amount 
    select c1.customername ,p1.amount ,
    c2.customername ,p2.amount
    from payments p2 
    inner join payments p1 on p1.amount= p2.amount  and p1.customerNumber<>p2.customerNumber
    inner join customers c1 on p1.customernumber = c1.customerNumber 
     inner join customers c2 on p2.customernumber = c2.customerNumber;
    
    -- above one WAS  wrong 
    
    select p1.customerNumber,c1.customerName,p1.amount,
    p2.customernumber,c2.customername 
    from payments p1
    inner join payments p2 on p1.amount =p2.amount and p1.customerNumber <> p2.customerNumber
    inner join customers c1 on p1.customerNumber=c1.customernumber
    inner join customers c2 on  p2.customerNumber = c2.customerNumber;
    
 select m.employeenumber  as m_id 
 ,m.firstname  as m_name ,e.employeenumber,
 m.jobTitle,
 e.firstname from employees m inner join employees e
 on m.employeeNumber=e.reportsTo;
    
   -- epm e_name first anme job title 
   select firstname ,jobTitle ,employeeNumber  from employees;
    
    -- find the orders that contain the same products
   select od1.ordernumber,od1.productcode,p.productname,
   od2.ordernumber
   from orderdetails od1 
   inner join orderdetails od2 on od1.productCode=od2.productCode 
   and od1.orderNumber<> od2.orderNumber
   inner join products p on od1.productCode=p.productCode;
    
-- important   VIEW virtual table 
                --  creaT VIEW      XYX   AS
    create view  same_Od_customer as  select p1.customerNumber as p1_name,
    c1.customerName as c1_name ,p1.amount p1_amount,
    p2.customernumber,c2.customername 
    from payments p1 inner join payments p2 
    on p1.amount =p2.amount and p1.customerNumber <> p2.customerNumber
    inner join customers c1 on p1.customerNumber=c1.customernumber
    inner join customers c2 on  p2.customerNumber = c2.customerNumber;
    
    select * from same_od_customer limit 4;
    
    -- cusotmer name payment date pay amount 
   create view customer_payment as select c.customername ,c.customerNumber,p.pAYMENTDATE,p.amount from payments p join
    customers c on c.customerNumber=p.customerNumber;
    
      select * from customer_payment where customernumber=112;
    
    desc customer_payment ;
    
--  CREATE A procedure to get all employee    details
    
 Delimiter //
create procedure sp_getallemp()
 begin 
 select * from employees ;
 end //
 Delimiter  ;
 
    call sp_getallemp();
    
    -- drop procedure sp_getallemp();
    
    
    -- create a procedure to get customers name where country is usa 
    Delimiter // 
    create procedure sp_customerByCountry()
    begin
    select customername from customers 
    where country ='USA';
    end //
    delimiter ;
    
    call sp_customerByCountry();
drop  procedure sp_customerByCountry ;

    -- parameters     in and out 
    
    delimiter //
    create procedure sp_customerByCountry(in countryname varchar(50))
    begin
    select customername ,country from customers
    where country = countryname ;
    end //
    delimiter ;
call sp_customerByCountry('france');
    
    -- create a procedure to update a customer's email.
    
 Delimiter  //
 create procedure sp_updateEmpByEmpno(in emp_no int ,in emailid varchar(50))
 begin 
 update employees
 set email = emailid
where  employeenumber = emp_no ;
 end //
 delimiter ;
    
   
   call sp_updateEmpByEmpno(1002,'a@gmail.com');
select  * from employees where employeeNumber= 1002 ;    
    
    -- get the total number of orders placed by a customer 
     
     delimiter //
     create procedure sp_getcustomerOrder(in cus_no int,out ordercount int )
     begin 
     select  count(ordernumber) into ordercount from orders
     where customerNumber = cus_no;
     end // 
     delimiter   ; 
    
    
    call sp_getcustomerOrder(103,@ordercount);
    drop procedure sp_getcustomerOrder;
    select @ordercount;
    -- advantage of @ordercount    security perpous   DBA developer     procedure or call not given only @ordercount

-- create a procedure to get the total number of products in a specifice product category and return it via out parameter
    
    delimiter //
    create procedure sp_productcountByCat (in p_line varchar(50),
    out productcount int )
    begin
    select count(productcount) into productcount from products
    where productline = p_line;
    end // 
    delimiter ;
    
    
    call sp_productcountByCat ('Classic Cars',@productcount);
    select @productcount;
    
    select productline from products limit 5;
    
    -- create a procedure to return the total payment made by a customer 
    
    use classicmodels;
     
     
    delimiter //
    create procedure sp_paymentByCustomer (in cus_no  int ,
    out total_payment  int )
    begin 
    select  sum(amount) into  total_payment from products 
     where customernumber = cus_no ;
    end //
    delimiter ;
    
    call sp_paymentByCustomer(103,@total_payment);
    select @total_payment;
    
    
    -- get the total number of orders using status 
    
    
    
    delimiter ;
    create procedure  sp_totalOrderByStatussp_totalOrderByStatus(in status_name  varchar(50),out ordercount int)
    begin 
    select count(ordernumber) into ordercount  from orders 
    where status = status_name;
    end // 
    delimiter ;
    
    call  sp_totalOrderByStatus('shipped',@ordercount );
    select sp_totalOrderByStatus;
    drop procedure ordercount;
    
    -- update the creditlimit by using customer number 
    -- insert a new employee into the employee table 
    
    -- create a procedure to get the payment of a customer by using customer id 
    use classicmodels ;
    delimiter // 
    create procedure sp_getCustPaymnet (in cus_id int )
    select  amount  from payments 
    where customernumber = cus_id;
    end // 
	delimiter ;
    
    call sp_getCustPaymnet(103);
    
    -- create a procedure to get the total number of orders by using customer id
    delimiter //
    create procedure sp_totalOrderByCusid(in cus_id int)
    begin 
    select count(ordernumber) from orders 
    where customernumber = cus_id;
    end //
    delimiter ;
    
    call sp_totalOrderByCusid(103);
    
    -- FUNCTION 
    delimiter //
    create function totalOrderbYCustid(custid int)
    returns int
    deterministic
    begin 
    declare order_count int; 
    select count(ordernumber) into order_count from 
    orders where customerNumber = custid;
    return order_count ;
    end  //
    delimiter ;
    
    drop function totalOrderbYCustid;
    select totalOrderbYCustid(103);
  delimiter //
  create function getEmpFullName(emp_id int)
  returns varchar(50)
  deterministic
  begin 
  declare fullname varchar(50);
  select concat(firstName," ",lastName) into fullname
  from employees where employeeNumber = emp_id;
  return fullname;
  end //
  
  delimiter   ;
  select getEmpFullName(1002);
select 
   table_name ,
   constraint_name,
   constraint_type,
   table_schema
   from
   information_schema.table_constraints
   where 
   table_schema ='classicmodels';
   
   select
   constraint_name,
   table_name,
   column_name,
   referenced_table_name,
    referenced_column_name
    from
    information_schema.key_column_usage
    where
    table_schema="classicmodels";
   
   
   create database codetech;
   use codetech;
  create table employees(
  employee_id int not null,
  name varchar(100) not null,
  email varchar(100) unique,
  salary decimal(7,2),
  check(salary >= 0),
  created_at timestamp default current_timestamp,
  primary key (employee_id)
  );
  
  create table order1 (
  order_id int primary key,
  employee_id int,
  foreign key (employee_id) references employees(employee_id)
  );
  
  
  desc employees;
  desc order1;
  
  -- create tigger to ensure a new customers credit limit is not negative before inserting the records 
  use classicmodels;
  delimiter //
  create trigger before_insert_creditlimit
  before insert on customers 
  for each row
  begin
  if new.creditlimit<0 then
  set new.creditlimit = 0 ;
  end if ;
  end ;
  //
  delimiter ;
  
  
insert into customers(customerNumber ,
customerName, 
contactLastName,  
contactFirstName ,
phone , 
addressLine1 , 
addressLine2,
city, 
state , 
postalCode,  
country,
salesRepEmployeeNumber, 
creditLimit )
values(
1034,'ducat','kumar','aman',
'123','gzb','gzb','gzb','up',
20102,'india',1002,-5600.54);  
  
  select customernumber,contactfirstname,creditlimit
  from customers where customerNumber=101;
  use classicmodels;
  create table customer_audit(
  audit_id int auto_increment primary key ,
  customerNumber int,
  customerName varchar(50),
  action_time timestamp default current_timestamp
  );
delimiter //
  
  
  
  
  create trigger after_insert_customer
  after  insert on customers
  for each row
  begin
  insert into customer_audit(customerNumber,customerName)
  values(new.customerNumber,new.customerName);
  end ;
  //
  delimiter ;


-- drop trigger after_insert_customer;
  insert into customers(customerNumber ,
customerName, 
contactLastName,  
contactFirstName ,
phone , 
addressLine1 , 
addressLine2,
city, 
state , 
postalCode,  
country,
salesRepEmployeeNumber, 
creditLimit )
values(
1044,'ducat','kumar','aman',
'123','gzb','gzb','gzb','up',
20102,'india',1002,-5600.54);  

select * from customer_audit;

-- create a trigger to prevent reducing customers creditlimit

select customernumber,creditlimit from
 customers where customernumber = 103;
 
 select sum(amount) from payments where customerNumber = 103;
 
 delimiter //
create trigger preventcreditlimit
before update on  customers 
for each row 
begin
	declare current_balance decimal(20,2);
	select sum(amount) into current_balance from
           payments where customerNumber = old.customernumber;
       if new.creditlimit < current_balance then 
          set new.creditlimit = old.creditlimit;
       end if ;
end;
//
delimiter ;



update customers set creditlimit = 45000
where customernumber = 103;

select creditlimit from customers where customernumber = 103;
update customers set creditlimit = 18000
where customernumber = 103;

select creditlimit from customers where customernumber = 103;

-- create a trigger to mentain the logs if there is a change in creditlimit 
create table credit_limit_changesLogs (
id  int auto_increment primary key,
customerNumber int,
oldcreditlimit decimal(10,2),
newcreditlimit decimal(10,2),
updated_at timestamp default current_timestamp);






delimiter //
create trigger after_update_creditlimit
after update on customers 
for each row 
begin 
insert into credit_limit_changesLogs(customernumber,old.creditlimit,new.creditlimit)
values(old.customernumber,old.creditlimit,new.creditlimit);
end;
delimiter ;




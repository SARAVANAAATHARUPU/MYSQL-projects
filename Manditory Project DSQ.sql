use northwind;

-- 1.Calculate average Unit Price for each CustomerId.
select o.customerID,od.unitPrice,
avg(unitprice)over(order by CustomerID desc) avg_unit_price
from orders o
inner join order_details od on od.orderId=o.orderId;


-- 2.Calculate average Unit Price for each group of CustomerId AND EmployeeId.
select o.customerID,o.EmployeeID,od.unitPrice,
avg(unitprice)over(order by customerID,EmployeeID desc) avg_unit_price
from orders o
inner join order_details od on od.orderId=o.orderId;


-- 3.Rank Unit Price in descending order for each CustomerId.
select o.customerID,od.unitPrice,
Rank()over(order by unitPrice desc) rank_unit_price
from orders o
inner join order_details od on od.orderId=o.orderId;

-- 4.How can you pull the previous order date’s Quantity for each ProductId.

select p.productId,p.productName,p.quantityperunit,o.orderDate,
lag(orderDate)over(order by OrderDate)pre_order_date
 from products p
 inner join order_details od on od.productID=p.productID
 inner join orders o on o.orderID=od.orderID;
 
 -- 5.How can you pull the following order date’s Quantity for each ProductId.

select p.productId,p.productName,p.quantityperunit,o.orderDate,
lead(orderDate)over(order by OrderDate)following_order_date
from products p
 inner join order_details od on od.productID=p.productID
 inner join orders o on o.orderID=od.orderID
 order by o.OrderDate ;

-- 6.Pull out the very first Quantity ever ordered for each ProductId.
select p.productId,p.productName,p.quantityperunit,o.orderDate,quantity,
first_value(Quantity)over(order by productID)very_first_quantity
 from products p
 inner join order_details od on od.productID=p.productID
 inner join orders o on o.orderID=od.orderID;
 

 
 -- 7.Calculate a cumulative moving average UnitPrice for each CustomerId.
 
 select o.customerID,od.unitPrice,
avg(unitprice)over(order by CustomerID desc) avg_unit_price,
cume_dist()over(order by customerID desc)Cum_moving_avg_unitprice
from orders o
inner join order_details od on od.orderId=o.orderId;


--------------------------------------------------------------------------------------------


-- Theory Questions

1.Can you define a trigger that is invoked automatically before a new row is inserted into a table?
Answer:
 
 We can use before insert trigger to create a new row is inserted in the table 
 
 -- CREATE TRIGGER trigger_name    
    -- (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
        -- ON table_name FOR EACH ROW    
         -- BEGIN    
        -- variable declarations    
        -- trigger code    
        -- END; 

2.What are the different types of triggers?
Answer: There are 6 types of triggers
         1.Before Insert - It is activated before the insertion of data into the table.
         2.After Insert - It is activated after the insertion of data into the table.
         3.Before Update - It is activated before the Updation of data into the table.
         4.After Update - It is activated after the Updation of data into the table.
         5.Before Delete - It is activated before the deletion of data into the table.
         6.After Delete - It is activated after the deletion of data into the table.
         
3. How is Metadata expressed and structured?

Answer: Meta data is data about the data or documentation about the information which is 
        required by the user
        
        Ex: When we read a book we have to check the Index,who is author and preface
        Meta data is in the form of information schema in the database

4. Explain RDS and AWS key management services.
Answer: AWS Key Management Service (AWS KMS) is a managed service that makes it easy for you to create and control the cryptographic keys 
	    that are used to protect your data.
        
         Amazon RDS automatically integrates with AWS Key Management Service (AWS KMS) for key management. 
         Amazon RDS uses envelope encryption.
         
5. What is the difference between amazon EC2 and RDS?
 Answer: 
 1.Amazon EC2:(Amazon elastic computer cloud)
        It is a web services that helps in running the application programs in the 
        AWS cloud
        Ex: amazon prime,amazon music and Amazon ecart
        
 2. RDS :
       It is managed by database a a service and it handle the management task,operational
       and scaling relation database
       
       popularly use in Mysql,maria db,aurora etc..,
 
   

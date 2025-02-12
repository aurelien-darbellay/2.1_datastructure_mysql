use culampolla;
select * from sales
where costumers_costumers_id = 1
and sales_timestamp >= "2025-02-10"
and sales_timestamp <= "2025-02-14";

select*from sales;

select*from sales
inner join glasses
on sales.sales_id = glasses.sales_sales_id
where sales.employees_employees_id = 2;

select * from glasses
left join sales
on glasses.sales_sales_id = sales.sales_id;

select suppliers.suppliers_name, brands.brands_name from suppliers
right join brands
on brands.suppliers_suppliers_id = suppliers.suppliers_id
right join glasses
on brands.brands_id = glasses.brands_idbrands
where glasses.sales_sales_id IS NOT NULL;

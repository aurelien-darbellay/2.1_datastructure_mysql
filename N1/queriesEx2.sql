use pizzeria;

select * from costumers;

select localities.localities_name as `target locality`, sum(orders_has_producttype.orders_has_productType_num) as `number of drinks sold` from orders_has_producttype
inner join orders
on orders_has_producttype.orders_orders_id = orders.orders_id
inner join employees
on orders.employees_employees_id = employees.employees_id
inner join stores
on employees.stores_stores_id = stores.stores_id
inner join localities
on stores.localities_localities_id = localities.localities_id
where localities.localities_name = "Barcelona City"
and orders_has_producttype.orders_productType = "Drink";

select count(orders_id), employees.employees_name from orders
inner join employees
on orders.employees_employees_id = employees.employees_id
where employees.employees_id = 1
group by orders.employees_employees_id;



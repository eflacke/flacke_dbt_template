{{ config(materialized='view') }}

with customer_orders as (
    select
        c.CustomerKey,
        c.FirstName,
        c.LastName,
        s.SalesOrderNumber,
        sum(s.SalesAmount) as total_sales_amount,
        count(s.SalesOrderNumber) as number_of_orders
    from
        {{ref('src_internet_sales')}} s
        join {{ref('src_customer')}} c on s.CustomerKey = c.CustomerKey
    group by
        c.CustomerKey,
        c.FirstName,
        c.LastName,
        s.SalesOrderNumber
)

select
    CustomerKey,
    FirstName,
    LastName,
    sum(total_sales_amount) as total_sales_amount,
    count(number_of_orders) as total_orders,
    avg(total_sales_amount) as avg_order_value
from
    customer_orders
group by
    CustomerKey,
    FirstName,
    LastName

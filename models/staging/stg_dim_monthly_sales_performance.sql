{{ config(materialized='view') }}

with monthly_sales as (
    select
        s.OrderDateKey,
        datepart(year, s.OrderDate) as year,
        datepart(month, s.OrderDate) as month,
        s.SalesOrderNumber,
        sum(s.SalesAmount) as total_sales_amount,
        count(s.SalesOrderNumber) as number_of_orders
    from
        {{ref('src_internet_sales')}} s
    group by
        s.OrderDateKey,
        datepart(year, s.OrderDate),
        datepart(month, s.OrderDate),
        s.SalesOrderNumber
)

select
    OrderDateKey,
    year,
    month,
    sum(total_sales_amount) as total_sales_amount,
    count(number_of_orders) as total_orders,
    avg(total_sales_amount) as avg_order_value
from
    monthly_sales
group by
    OrderDateKey,
    year,
    month

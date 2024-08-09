{{ config(materialized='view') }}

with product_sales as (
    select
        p.ProductKey,
        p.EnglishProductName as ProductName,
        s.SalesOrderNumber,
        sum(s.SalesAmount) as total_sales_amount,
        sum(s.OrderQuantity) as total_units_sold
    from
        {{ref('src_internet_sales')}} s
        join {{ref('src_product')}} p on s.ProductKey = p.ProductKey
    group by
        p.ProductKey,
        p.EnglishProductName,
        s.SalesOrderNumber
)

select
    ProductKey,
    ProductName,
    sum(total_sales_amount) as total_sales_amount,
    sum(total_units_sold) as total_units_sold,
    avg(total_sales_amount) as avg_sales_amount_per_order
from
    product_sales
group by
    ProductKey,
    ProductName

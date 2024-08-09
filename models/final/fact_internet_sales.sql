{{ config(materialized='view') }}

with customer_orders as (
    select
        s.SalesOrderNumber,
        s.OrderDateKey,
        s.DueDateKey,
        s.ShipDateKey,
        s.CustomerKey,
        s.ProductKey,
        s.SalesAmount,
        s.OrderQuantity,
        s.UnitPrice,
        s.ExtendedAmount,
        s.TaxAmt,
        s.Freight,
        s.TotalProductCost,
        c.FirstName,
        c.LastName,
        p.ProductName,
        d.OrderDateKey as OrderDate
    from
        {{ref('src_internet_sales')}} s
        join {{ref('stg_dim_customer_sales_summary')}} c on s.CustomerKey = c.CustomerKey
        join {{ref('stg_dim_product_sales_summary')}} p on s.ProductKey = p.ProductKey
        join {{ref('stg_dim_monthly_sales_performance')}} d on s.OrderDateKey = d.OrderDateKey
)

select * from customer_orders


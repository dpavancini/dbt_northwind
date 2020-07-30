{{ config(materialized='table') }}

with source_data as (

    select    
      order_id
    , employee_id
    , order_date
    , customer_id
    , ship_region 
    , shipped_date
    , ship_country
    , ship_name
    , ship_postal_code
    , ship_city
    , freight
    , ship_via as shipper_id
    , ship_address
    , required_date
    from {{source('northwind_erp','orders')}}
)

select *
from source_data

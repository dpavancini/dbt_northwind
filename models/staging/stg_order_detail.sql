{{ config(materialized='table') }}

with source_data as (

    select
      product_id
    , discount
    , unit_price
    , quantity
    , order_id
    , _sdc_table_version
    , _sdc_received_at
    , _sdc_sequence
    , _sdc_batched_at
    , _sdc_extracted_at
    from {{source('northwind_erp','order_details')}}
)

select *
from source_data

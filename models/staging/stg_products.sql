{{ config(materialized='table') }}

with source_data as (

    select
      product_id
    , product_name
    , units_in_stock
    , category_id
    , unit_price
    , quantity_per_unit
    , reorder_level
    , supplier_id
    , units_on_order
    , discontinued
    , _sdc_sequence
    , _sdc_received_at
    , _sdc_table_version
    , _sdc_batched_at
    , _sdc_extracted_at
    from {{source('northwind_erp','products')}}
)

select *
from source_data

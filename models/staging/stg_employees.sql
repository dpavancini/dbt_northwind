{{ config(materialized='table') }}

with source_data as (

    select
      employee_id    
    , first_name ||" "|| last_name as name
    , first_name
    , last_name
    , country
    , city
    , postal_code
    , hire_date
    , extension
    , address
    , birth_date
    , region
    , photo_path
    , home_phone
    , reports_to
    , title
    , title_of_courtesy
    , notes
    , _sdc_batched_at
    , _sdc_extracted_at
    , _sdc_received_at
    , _sdc_sequence
    , _sdc_table_version
    from {{source('northwind_erp','employees')}}
)

select *
from source_data

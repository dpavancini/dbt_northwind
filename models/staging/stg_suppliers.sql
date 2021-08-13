with
    source_data as (
        select
            supplier_id
            ,  country
            ,  city
            ,  fax
            ,  postal_code
            ,  homepage
            ,  address
            ,  region
            ,  contact_name
            ,  phone
            ,  company_name
            ,  contact_title
            -- ,  _sdc_table_version
            -- ,  _sdc_received_at
            -- ,  _sdc_sequence
            -- ,  _sdc_batched_at
            -- ,  _sdc_extracted_at
        from {{source('northwind_erp','suppliers')}}
    )

select *
from source_data

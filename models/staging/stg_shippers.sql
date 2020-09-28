with
    source_data as (
        select
            phone
            , company_name
            , shipper_id
            , _sdc_extracted_at
            , _sdc_sequence
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_table_version
        from {{source('northwind_erp','shippers')}}
    )

select *
from source_data

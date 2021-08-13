with
    source_data as (
        select
            order_id
            , product_id
            , discount
            , unit_price
            , quantity
            -- , _sdc_table_version
            -- , _sdc_received_at
            -- , _sdc_sequence
            -- , _sdc_batched_at
            -- , _sdc_extracted_at
        from {{source('northwind_erp','order_details')}}
    )

select *
from source_data

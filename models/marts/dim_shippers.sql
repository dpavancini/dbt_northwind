with
    staging as (
        select *
        from {{ref('stg_shippers')}}
    )
    , transformed as (
        select
            row_number() over (order by shipper_id) as shipper_sk -- auto-incremental surrogate key
            , phone
            , company_name
            , shipper_id
        from staging
    )

select *  from transformed

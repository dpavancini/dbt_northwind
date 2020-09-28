with
    suppliers as (
        select *
        from {{ ref('stg_suppliers') }}
    )
    , divisions as (
        select *
        from {{ ref('seed_supplier_divisions')}}
    )
    , transformed as (
        select
            row_number() over (order by suppliers.supplier_id) as supplier_sk -- auto-incremental surrogate key
            , suppliers.supplier_id
            , suppliers.country
            , suppliers.city
            , suppliers.fax
            , suppliers.postal_code
            , suppliers.homepage
            , suppliers.address
            , suppliers.region
            , suppliers.contact_name
            , suppliers.phone
            , suppliers.company_name
            , suppliers.contact_title
            , divisions.division
        from suppliers
        left join divisions on suppliers.country = divisions.country
    )

select *  from transformed

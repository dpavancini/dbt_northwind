with staging as (
    select
    *
    from {{ref('stg_employees')}}
),

transformed as (
    select
    row_number() OVER (ORDER BY employee_id) as employee_sk -- auto-incremental surrogate key
    , employee_id
    , reports_to
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
    , employee_id
    , title
    , title_of_courtesy
    , notes
    from staging
)

select *  from transformed
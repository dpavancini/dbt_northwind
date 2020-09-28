/* If count of orders in March-1998 is not 73, throws an error */

with
    sum_quantity as (
        SELECT
            sum(quantity) as cnt
        FROM {{ ref ('fct_order_detail') }}
        where order_date
        between '1998-03-01' and '1998-03-31'
    )

select * from sum_quantity where cnt != 4065


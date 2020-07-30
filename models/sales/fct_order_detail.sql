with customers as (
    select
      customer_sk
    , customer_id
    FROM {{ref('dim_customers')}}    
),

employees as (
    select
      employee_sk
    , employee_id
    FROM {{ref('dim_employees')}}    
),

suppliers as (
    select
      supplier_sk
    , supplier_id
    FROM {{ref('dim_suppliers')}}    
),

shippers as (
    select
      shipper_sk
    , shipper_id
    FROM {{ref('dim_shippers')}}    
),

products as (
    select
      product_sk
    , product_id
    FROM {{ref('dim_products')}}    
),

orders_with_sk as (
    select
      orders.order_id
    , employees.employee_sk as employee_fk
    , customers.customer_sk as customer_fk
    , shippers.shipper_sk as shipper_fk
    , orders.order_date
    , orders.ship_region 
    , orders.shipped_date
    , orders.ship_country
    , orders.ship_name
    , orders.ship_postal_code
    , orders.ship_city
    , orders.freight
    , orders.ship_address
    , orders.required_date
    from {{ref('stg_orders')}} orders
    left join employees employees on orders.employee_id = employees.employee_id
    left join customers customers on orders.customer_id = customers.customer_id
    left join shippers shippers on orders.shipper_id = shippers.shipper_sk
),

orders_detail_with_sk as (
    select
      order_dtl.order_id
    , products.product_sk as product_fk
    , order_dtl.discount
    , order_dtl.unit_price
    , order_dtl.quantity
    from {{ref('stg_order_detail')}} order_dtl
    left join products products ON order_dtl.product_id = products.product_id
),

/* We then join orders and orders detail to get the final fact table*/

final as (
    select
      order_dtl.order_id
    , order_dtl.product_fk
    , order_dtl.discount
    , order_dtl.unit_price
    , order_dtl.quantity
    , orders.employee_fk
    , orders.customer_fk
    , orders.shipper_fk
    , orders.order_date
    , orders.ship_region 
    , orders.shipped_date
    , orders.ship_country
    , orders.ship_name
    , orders.ship_postal_code
    , orders.ship_city
    , orders.freight
    , orders.ship_address
    , orders.required_date
    from orders_with_sk orders
    left join orders_detail_with_sk order_dtl ON orders.order_id = order_dtl.order_id

)

select * from final






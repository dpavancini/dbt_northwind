{% snapshot orders_snapshot %}

{{
    config(
      target_database='tutorial-dbt-284217',
      target_schema='snapshots',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='order_date',
    )
}}

select * from {{ source('northwind_erp', 'orders') }}

{% endsnapshot %}

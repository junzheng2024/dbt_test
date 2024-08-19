{{
  config(
    materialized = 'incremental',
    transient = False,
    unique_key = 'result_id'
  )
}}

with empty_table as (
    select
        cast(null as char(255)) as result_id,
        cast(null as char(255)) as invocation_id,
        cast(null as char(255)) as unique_id,
        cast(null as char(255)) as database_name,
        cast(null as char(255)) as schema_name,
        cast(null as char(255)) as name,
        cast(null as char(255)) as resource_type,
        cast(null as char(255))as status,
        cast(null as float) as execution_time,
        cast(null as signed) as rows_affected
)

select * from empty_table
where 1 = 0
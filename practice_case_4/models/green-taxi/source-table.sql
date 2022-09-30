{{config(materialized='table')}}
with source_table as (select * from {{source('green','january')}}
union all
select * from {{source('green','february')}}
union all
select * from {{source('green','march')}}
union all
select * from {{source('green','april')}}
union all
select * from {{source('green','may')}}
union all
select * from {{source('green','june')}}
union all
select * from {{source('green','july')}}
union all
select * from {{source('green','agustus')}}
union all
select * from {{source('green','september')}}
union all
select * from {{source('green','october')}}
union all
select * from {{source('green','november')}}
union all
select * from {{source('green','december')}})

select * from source_table

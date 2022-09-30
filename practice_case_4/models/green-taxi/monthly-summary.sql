with monthly_summary as (select  EXTRACT(MONTH FROM DATE(lpep_pickup_datetime))  AS month,
        count(trip_distance) as total_pickup,
        avg(trip_distance) as average_trip_distance,
        sum(passenger_count) as total_passenger,
        sum (total_amount) as total_amount
from {{ref('source-table')}}
group by month
order by month asc)
select * from monthly_summary

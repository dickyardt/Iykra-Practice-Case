with monthly_summary as (select  EXTRACT(MONTH FROM DATE(lpep_pickup_datetime))  AS month,
        count(trip_distance) as total_pickup,
        sum(trip_distance) as total_trip_distance,
        avg(trip_distance) as average_trip_distance,
        sum(passenger_count) as total_passenger,
        avg(passenger_count) as average_passenger,
        sum (total_amount) as total_amount,
        avg(total_amount) as average_amount
from {{ref('source-table')}}
group by month
order by month asc)
select * from monthly_summary

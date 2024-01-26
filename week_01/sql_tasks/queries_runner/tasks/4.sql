-- Question 4. Largest trip for each day
-- Which was the pick up day with the largest trip distance
-- Use the pick up time for your calculations.

-- 2019-09-18
-- 2019-09-16
-- x 2019-09-26
-- 2019-09-21

select date(lpep_pickup_datetime)
from taxi_table
group by date(lpep_pickup_datetime)
order by max(trip_distance) desc
limit 1

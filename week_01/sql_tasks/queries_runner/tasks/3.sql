-- Question 3. Count records
-- How many taxi trips were totally made on September 18th 2019?

-- Tip: started and finished on 2019-09-18.

-- Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp (date and hour+min+sec) and not in date.

-- 15767
-- x 15612
-- 15859
-- 89009

select count(*)
from taxi_table
where date(lpep_pickup_datetime) = '2019-09-18' and
	  date(lpep_dropoff_datetime) = '2019-09-18'

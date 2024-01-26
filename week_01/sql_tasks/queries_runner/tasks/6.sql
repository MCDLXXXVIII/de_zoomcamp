-- Question 6. Largest tip
-- For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

-- Note: it's not a typo, it's tip , not trip

-- Central Park
-- Jamaica
-- x JFK Airport
-- Long Island City/Queens Plaza

-- Straightforward approach

-- select do_zones."Zone"
-- from taxi_table
-- inner join zones pu_zones on taxi_table."PULocationID" = pu_zones."LocationID"
-- inner join zones do_zones on taxi_table."DOLocationID" = do_zones."LocationID"
-- where date(lpep_pickup_datetime) between '2019-09-01' and '2019-09-30' and
-- 	  pu_zones."Zone" = 'Astoria'
-- group by do_zones."Zone"
-- order by max(tip_amount) desc
-- limit 1

select "Zone"
from zones
where "LocationID" = ( select "DOLocationID"
					   from taxi_table
		               where "PULocationID" = ( select "LocationID"
												from zones
												where "Zone" = 'Astoria')
						group by "DOLocationID"
						order by max(tip_amount) desc
						limit 1)

-- Question 5. Three biggest pick up Boroughs
-- Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown

-- Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?

-- "Brooklyn" "Manhattan" "Queens"
-- "Bronx" "Brooklyn" "Manhattan"
-- "Bronx" "Manhattan" "Queens"
-- "Brooklyn" "Queens" "Staten Island"

select string_agg("Borough", ', ') AS top_boroughs
from ( select "Borough"
       from taxi_table
       inner join zones on taxi_table."PULocationID" = zones."LocationID"
       where date(lpep_pickup_datetime) = '2019-09-18' and "Borough" != 'Unknown'
       group by "Borough"
       order by sum(total_amount) desc
       limit 3
) as subquery

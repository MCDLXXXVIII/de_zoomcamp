SELECT DISTINCT PULocationID
FROM `dtc-de-course-411617.demo_dataset.green_tripdata_2022_partitioned`
WHERE lpep_pickup_datetime BETWEEN '2022-06-01' AND '2022-06-30'

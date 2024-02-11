CREATE TABLE dtc-de-course-411617.demo_dataset.green_tripdata_2022_partitioned
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS
    SELECT *
    FROM dtc-de-course-411617.demo_dataset.green_data_2022_native

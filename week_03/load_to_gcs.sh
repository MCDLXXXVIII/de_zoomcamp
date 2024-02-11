#!/bin/bash

BASE_URL="https://d37ci6vzurychx.cloudfront.net/trip-data"
GCS_BUCKET="dtc-de-course-411617_demo_bucket"

for month in {1..12}; do
    MONTH_FORMATTED=$(printf "%02d" $month)
    FILE_URL="${BASE_URL}/green_tripdata_2022-${MONTH_FORMATTED}.parquet"
    GCS_PATH="gs://${GCS_BUCKET}/green_tripdata_2022/green_tripdata_2022-${MONTH_FORMATTED}.parquet"

    echo "Downloading ${FILE_URL} and uploading to ${GCS_PATH}..."
    curl "${FILE_URL}" | gsutil cp - "${GCS_PATH}"

    if [ $? -eq 0 ]; then
        echo "Download and upload successful."
    else
        echo "Failed to download and upload ${FILE_URL} to ${GCS_PATH}."
    fi
done

echo "Script completed."

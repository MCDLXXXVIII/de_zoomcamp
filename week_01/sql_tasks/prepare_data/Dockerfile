FROM python:3.9-alpine

WORKDIR /app
COPY . /app

RUN wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz  \
    && wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "ingest_db.py"]

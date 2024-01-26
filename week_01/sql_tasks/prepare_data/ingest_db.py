import pandas as pd
from sqlalchemy import create_engine
import os


def main():
    if os.path.exists("/sync/data_ready"):
        return

    db_user = os.environ.get('POSTGRES_USER')
    db_password = os.environ.get('POSTGRES_PASSWORD')
    db_host = os.environ.get('POSTGRES_HOST')
    db_port = os.environ.get('POSTGRES_PORT')
    db_name = os.environ.get('POSTGRES_DB')

    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")
    df_tripdata_iter = pd.read_csv("green_tripdata_2019-09.csv.gz", iterator=True, chunksize=100000)

    for df in df_tripdata_iter:
        df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
        df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
        df.to_sql(name="taxi_table", con=engine, if_exists="append")
        print("Inserted another chunk")

    df_zones = pd.read_csv("taxi+_zone_lookup.csv")
    df_zones.to_sql(name="zones", con=engine, if_exists="replace")
    print("DATABASE IS READY!")

    with open("/sync/data_ready", "w") as f:
        f.write("Data preparation is complete.")


if __name__ == "__main__":
    main()

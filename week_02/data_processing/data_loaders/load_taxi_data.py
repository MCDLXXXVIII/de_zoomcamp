if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
import pandas as pd

BASE_URL = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green"
YEARS = [2020]
MONTHS = [10, 11, 12]

@data_loader
def load_data(*args, **kwargs):
    dfs = []
    for year in YEARS:
        for month in MONTHS:
            url = f"{BASE_URL}/green_tripdata_{year}-{month}.csv.gz"
            dfs.append(pd.read_csv(url, parse_dates=["lpep_pickup_datetime",
                                                     "lpep_dropoff_datetime"]))

    return pd.concat(dfs, ignore_index=True)


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'
    print(output["VendorID"].unique())



import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


BASE_URL = "https://d37ci6vzurychx.cloudfront.net/trip-data"

@data_loader
def load_data_from_api(*args, **kwargs):
    dfs = []
    for month in range(1, 13):
        url = f"{BASE_URL}/green_tripdata_2022-{month:02}.parquet"
        dfs.append(pd.read_parquet(url, engine="pyarrow"))
    
    return pd.concat(dfs, ignore_index=True)


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'

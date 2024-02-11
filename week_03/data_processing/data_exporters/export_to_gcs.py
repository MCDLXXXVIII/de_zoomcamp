from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.google_cloud_storage import GoogleCloudStorage
from pandas import DataFrame
from os import path
import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/data_processing/keys/credentials.json"

@data_exporter
def export_data_to_google_cloud_storage(df: DataFrame, **kwargs) -> None:
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

    bucket_name = 'dtc-de-course-411617_demo_bucket'
    table_name = 'green_taxi_2022'

    pq.write_to_dataset(
        table=pa.Table.from_pandas(df),
        root_path=f"{bucket_name}/{table_name}",
        use_deprecated_int96_timestamps=True,
        filesystem=pa.fs.GcsFileSystem()
    )


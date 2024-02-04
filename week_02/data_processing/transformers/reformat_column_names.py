if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

import re


@transformer
def transform(df, *args, **kwargs):
    def camel_to_snake(name):
        return re.sub(r'(?<=[a-z0-9])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])', '_', name).lower()

    df.columns = [camel_to_snake(col) for col in df.columns]
    return df


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'
    print(output["vendor_id"].unique())


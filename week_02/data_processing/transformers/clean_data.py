
from mage_ai.data_cleaner.transformer_actions.base import BaseAction
from mage_ai.data_cleaner.transformer_actions.constants import ActionType, Axis
from mage_ai.data_cleaner.transformer_actions.utils import build_transformer_action
from pandas import DataFrame

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

import pandas as pd
@transformer
def execute_transformer_action(df: DataFrame, *args, **kwargs) -> DataFrame:
    action = build_transformer_action(
        df,
        action_type=ActionType.FILTER,
        axis=Axis.ROW,
        action_code='passenger_count > 0 and trip_distance > 0.0',
    )

    return BaseAction(action).execute(df)


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'
    assert ((output['passenger_count'] > 0) & (output['trip_distance'] > 0.0)).all(), \
        'Found invalid values in output'

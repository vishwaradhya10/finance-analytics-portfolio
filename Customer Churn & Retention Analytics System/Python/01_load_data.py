"""
Purpose:
Load churn feature dataset from PostgreSQL.
"""

import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres@localhost:5433/Saas_Finance"
)

query = "SELECT * FROM churn_feature_table;"
churn_df = pd.read_sql(query, engine)

"""
Purpose:
Load marketing and revenue data from PostgreSQL.
"""

import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres@localhost:5433/Saas_Finance"
)

marketing_df = pd.read_sql("SELECT * FROM marketing_campaigns;", engine)
revenue_df = pd.read_sql("SELECT * FROM subscriptions;", engine)

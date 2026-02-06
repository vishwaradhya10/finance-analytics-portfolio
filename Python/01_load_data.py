"""
Purpose:
Load SQL output into Python for analysis.
"""

import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres@localhost:5433/Saas_Finance"
)

query = "SELECT * FROM finance_summary;"
finance_df = pd.read_sql(query, engine)

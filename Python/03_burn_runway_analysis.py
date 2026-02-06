"""
Purpose:
Calculate average burn and runway.
"""

cash_balance = 500000  # assumed cash balance

avg_burn = finance_df['net_burn'].tail(6).mean()
runway_months = cash_balance / avg_burn

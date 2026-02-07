"""
Purpose:
Calculate average Lifetime Value (LTV).
"""

ltv_df = revenue_df.groupby('account_id')['monthly_revenue'].sum().reset_index()
avg_ltv = ltv_df['monthly_revenue'].mean()

print("Average LTV:", round(avg_ltv, 2))

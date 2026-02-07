"""
Purpose:
Calculate revenue at risk from high-risk customers.
"""

revenue_at_risk = churn_df[
    churn_df['risk_segment'] == 'High Risk'
]['total_revenue'].sum()

print("Revenue at Risk:", round(revenue_at_risk, 2))

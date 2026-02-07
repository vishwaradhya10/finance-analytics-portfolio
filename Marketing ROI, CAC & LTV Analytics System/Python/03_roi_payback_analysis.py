"""
Purpose:
Calculate ROI score and CAC payback period.
"""

marketing_summary = marketing_df.groupby('channel').agg({
    'spend': 'sum',
    'conversions': 'sum'
}).reset_index()

marketing_summary['cac'] = (
    marketing_summary['spend'] / marketing_summary['conversions']
)

avg_monthly_revenue = revenue_df['monthly_revenue'].mean()

marketing_summary['payback_months'] = (
    marketing_summary['cac'] / avg_monthly_revenue
)

marketing_summary['roi_score'] = avg_ltv / marketing_summary['cac']

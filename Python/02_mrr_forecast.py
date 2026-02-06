"""
Purpose:
Forecast MRR using historical growth rate.
"""

finance_df['growth_rate'] = finance_df['total_mrr'].pct_change()
avg_growth = finance_df['growth_rate'].mean()

def forecast_mrr(start_mrr, growth, months=12):
    forecast = []
    current = start_mrr
    for _ in range(months):
        current *= (1 + growth)
        forecast.append(current)
    return forecast

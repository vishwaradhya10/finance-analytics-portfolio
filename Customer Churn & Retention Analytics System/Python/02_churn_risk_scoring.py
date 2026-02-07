"""
Purpose:
Calculate churn risk score.
"""

# Normalize lifetime
churn_df['lifetime_norm'] = (
    churn_df['lifetime_days'] / churn_df['lifetime_days'].max()
)

# Simple risk score
churn_df['risk_score'] = (
    0.6 * (1 - churn_df['lifetime_norm']) +
    0.4 * churn_df['churned']
)

# Risk segments
churn_df['risk_segment'] = pd.cut(
    churn_df['risk_score'],
    bins=[-0.01, 0.3, 0.6, 1],
    labels=['Low Risk', 'Medium Risk', 'High Risk']
)

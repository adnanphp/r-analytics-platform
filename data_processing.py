# data_processing.py
import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import os

print("Generating customer data...")

np.random.seed(42)

n_customers = 50000

# ============================
# Generate features
# ============================

df = pd.DataFrame({
    'customer_id': range(1, n_customers + 1),
    'age': np.random.randint(18, 70, n_customers),
    'gender': np.random.choice(['M', 'F'], n_customers),
    'region': np.random.choice(['North', 'South', 'East', 'West'], n_customers),
    'plan_type': np.random.choice(['Basic', 'Premium', 'Enterprise'], n_customers, p=[0.5, 0.35, 0.15]),
    'total_usage': np.random.exponential(200, n_customers).astype(int) + 50,
    'login_count': np.random.poisson(15, n_customers),
    'transaction_count': np.random.poisson(8, n_customers),
    'total_revenue': np.random.exponential(1000, n_customers) + 100,
    'satisfaction_score': np.random.uniform(1, 5, n_customers),
    'support_tickets': np.random.poisson(2, n_customers),
})

# Dates
today = datetime.now()
df['registration_date'] = [today - timedelta(days=np.random.randint(30, 1095)) for _ in range(n_customers)]
df['last_activity_date'] = df['registration_date'] + timedelta(days=np.random.randint(1, 365))

# Clip last activity to not exceed today
df['last_activity_date'] = df['last_activity_date'].clip(upper=today)

# Derived features
df['days_since_registration'] = (today - df['registration_date']).dt.days
df['days_since_activity'] = (today - df['last_activity_date']).dt.days
df['usage_intensity'] = df['total_usage'] / (df['days_since_registration'] + 1)
df['engagement_score'] = (df['login_count'] + df['transaction_count']) / (df['days_since_registration'] + 1)

# Marketing
df['marketing_channel'] = np.random.choice(['Email', 'Social Media', 'Referral', 'Paid Ads', 'Organic'], n_customers)
df['device_type'] = np.random.choice(['Mobile', 'Desktop', 'Tablet'], n_customers)

# ============================
# CREATE CHURN TARGET (~20%)
# ============================

# Start with all active (0)
df['churned'] = 0

# Rule 1: Inactive for 90+ days -> churned
df.loc[df['days_since_activity'] > 90, 'churned'] = 1

# Rule 2: Low engagement (< 0.005) AND Basic plan -> churned
low_engage = (df['engagement_score'] < 0.005) & (df['plan_type'] == 'Basic')
df.loc[low_engage, 'churned'] = 1

# Rule 3: Low satisfaction (< 2) AND high support tickets (> 3) -> churned
bad_experience = (df['satisfaction_score'] < 2) & (df['support_tickets'] > 3)
df.loc[bad_experience, 'churned'] = 1

# Rule 4: Random churn to reach ~20% total
not_churned_idx = df[df['churned'] == 0].index
n_to_churn = int(len(not_churned_idx) * 0.08)
random_churn = np.random.choice(not_churned_idx, size=n_to_churn, replace=False)
df.loc[random_churn, 'churned'] = 1

# ============================
# Verify churn rate
# ============================

churn_rate = df['churned'].mean() * 100
print(f"Churn rate: {churn_rate:.1f}%")

# If still 100%, force fix
if churn_rate > 95:
    print("⚠️ Churn rate too high! Forcing fix...")
    # Randomly assign churn with 20% probability
    df['churned'] = np.random.choice([0, 1], size=n_customers, p=[0.8, 0.2])
    churn_rate = df['churned'].mean() * 100
    print(f"Fixed churn rate: {churn_rate:.1f}%")

# ============================
# Save data
# ============================

os.makedirs('data/processed', exist_ok=True)
df.to_csv('data/processed/processed_data.csv', index=False)

print(f"✅ Generated {n_customers:,} records")
print(f"✅ Active customers: {(df['churned'] == 0).sum():,}")
print(f"✅ Churned customers: {df['churned'].sum():,}")
print(f"✅ Churn rate: {churn_rate:.1f}%")
print("✅ Data saved to data/processed/")

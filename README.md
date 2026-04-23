# Machine Downtime Analytics & Predictive Maintenance

> An end-to-end data science project that predicts machine failure using
> sensor data - from raw data cleaning and SQL/Python EDA to deployed
> real-time inference, post-deployment monitoring, and an interactive
> Power BI dashboard.

---

## Business Problem

Unplanned machine downtime is one of the most costly problems in
manufacturing. A 50.60% failure rate across machines signals a
**systemic maintenance issue** - not isolated incidents. This project
builds a predictive maintenance system that flags high-risk machines
**before** failure occurs.

---

## Power BI Dashboard

<img width="1312" height="735" alt="Screenshot 2026-04-23 092433" src="https://github.com/user-attachments/assets/fea007eb-6521-4e33-839b-47c7bce63921" />


### KPI Summary

| Metric | Value |
|---|---|
| Total Machine Failures | ~1,265 (1K) |
| Failure Rate | 50.60% |
| Reliability Rate | 49.40% |
| Data Period | Nov 2021 – Jul 2022 |

### Key Findings

- **Machine L1** recorded the highest failure count (454) across all
  three machines — identified as the top priority for maintenance
- **March 2022** was the peak failure month with 533 failures —
  warrants investigation into operational conditions during that period
- **Hydraulic pressure above 100 bar** correlates with increased
  failure clustering, visible in the sensor scatter plot
- The 50.60% failure rate confirms a systemic maintenance issue
  requiring structural intervention, not reactive repairs

### Business Recommendations

- Prioritize preventive maintenance schedule for **Machine L1**
- Investigate **March 2022** operational logs for root cause of failure spike
- Set **hydraulic pressure alerts at 100 bar** threshold
- Target reduction of failure rate from **50.60% → 35%** through
  proactive maintenance scheduling

---

## Project Structure

| File | Description |
|---|---|
| `Project Machine Downtime.ipynb` | Data cleaning, preprocessing & ML modeling |
| `EDAusingPython.ipynb` | Exploratory Data Analysis with Python |
| `SQL_EDA.sql` | EDA using SQL queries |
| `Deployment using GRadio.ipynb` | Real-time prediction app with Gradio |
| `Monitoring and Testing Machine Downtime.ipynb` | Model monitoring with Evidently.ai |
| `Testing with New Test Set.ipynb` | Model validation on unseen data |

---

## Dataset

- **Records:** ~2,500 sensor readings across 3 machines (L1, L2, L3)
- **Period:** November 2021 – July 2022
- **Features:** 13 sensor & operational variables:

| Feature | Type |
|---|---|
| Hydraulic Pressure (bar) | Numerical |
| Coolant Pressure (bar) | Numerical |
| Air System Pressure (bar) | Numerical |
| Coolant Temperature (°C) | Numerical |
| Hydraulic Oil Temperature (°C) | Numerical |
| Spindle Bearing Temperature (°C) | Numerical |
| Spindle Vibration (μm) | Numerical |
| Tool Vibration (μm) | Numerical |
| Spindle Speed (RPM) | Numerical |
| Voltage (V) | Numerical |
| Torque (Nm) | Numerical |
| Cutting Force (kN) | Numerical |
| **Downtime** | **Target — FAILURE / NON_FAILURE** |

---

## Data Preprocessing & EDA

- Checked for null values, duplicate rows, and data type inconsistencies
- Identified and analyzed outliers via boxplots and statistical summaries
- Performed univariate and bivariate analysis across all sensor features
- Used both **SQL** and **Python** for comprehensive exploratory analysis
- Generated correlation heatmaps, distribution plots, and scatter plots
- Key EDA finding: Hydraulic pressure and spindle vibration show the
  strongest correlation with machine failure events

---

## Model Building & Evaluation

Five ML algorithms were trained and evaluated:

K-Nearest Neighbors, Decision Tree, Random Forest, SVM &
**Naïve Bayes (Best)** with accuracy **98.6%**

### Best Model — Naïve Bayes

| Class | Precision | Recall | F1-Score | Support |
|---|---|---|---|---|
| FAILURE | 0.97 | 1.00 | 0.99 | 480 |
| NON_FAILURE | 1.00 | 0.97 | 0.99 | 480 |
| **Weighted Avg** | **0.99** | **0.99** | **0.99** | **960** |

**Why Naïve Bayes?**
- Highest accuracy at 98.6% on the test set
- Perfectly balanced precision and recall across both failure classes
- Computationally lightweight — suitable for real-time inference
- Outperformed tree-based and distance-based models on this sensor dataset

---

## Deployment

- Built an interactive **real-time prediction interface using Gradio**
- Maintenance teams can input live sensor readings and receive
  instant failure/non-failure predictions
- Enables proactive intervention before actual machine breakdown occurs

---

## Model Monitoring

- Implemented post-deployment monitoring using **Evidently.ai**
- Tracked **data drift** between training distribution and new incoming data
- Monitored **model performance degradation** over time on new test batches
- Validated model stability on a separate held-out test set
- Ensures the deployed model remains trustworthy as real-world data evolves

---

## Tech Stack

| Category | Tools |
|---|---|
| Languages | Python, SQL |
| Data Processing | Pandas, NumPy |
| Visualization | Matplotlib, Seaborn, Power BI |
| Machine Learning | Scikit-learn |
| Deployment | Gradio |
| Monitoring | Evidently.ai |
| Environment | Jupyter Notebook |

---

## Quick Links

- [Main Project Notebook](Project%20Machine%20Downtime.ipynb)
- [EDA Notebook](EDAusingPython.ipynb)
- [SQL EDA](SQL_EDA.sql)
- [Gradio Deployment](Deployment%20using%20GRadio.ipynb)
- [Evidently.ai Monitoring](Monitoring%20and%20Testing%20Machine%20Downtime.ipynb)

# Machine Downtime Analytics & Predictive Maintenance

> An end-to-end data science project that predicts machine failure using 
> sensor data — from raw data cleaning to deployed real-time inference 
> with post-deployment monitoring.

---

## Business Problem

Unplanned machine downtime is one of the most costly problems in 
manufacturing. This project builds a predictive maintenance system that 
flags high-risk machines before failure occurs — enabling operations 
teams to act proactively rather than reactively.

---

## Project Structure

| Notebook | Description |
|---|---|
| `Project Machine Downtime.ipynb` | Data cleaning, preprocessing & ML modeling |
| `EDAusingPython.ipynb` | Exploratory Data Analysis with Python |
| `SQL_EDA.sql` | EDA using SQL queries |
| `Deployment using GRadio.ipynb` | Real-time prediction app with Gradio |
| `Monitoring and Testing Machine Downtime.ipynb` | Model monitoring with Evidently.ai |
| `Testing with New Test Set.ipynb` | Model validation on unseen data |

---

## Dataset

- **Features:** 13 sensor & operational variables including Hydraulic 
  Pressure, Coolant Temperature, Spindle Vibration, Tool Vibration, 
  Spindle Speed, Voltage, Torque, and Cutting Force
- **Target:** `Downtime` — binary classification (FAILURE / NON_FAILURE)

---

## Data Preprocessing & EDA

- Checked for null values, duplicate rows, and data type inconsistencies
- Identified outliers via boxplots and statistical analysis
- Performed univariate and bivariate analysis
- Used both **SQL** and **Python** for exploratory analysis
- Generated correlation heatmaps, distribution plots, and scatter plots

---

## Model Building & Evaluation

Five ML algorithms were trained and evaluated:

| Model | Accuracy |
|---|---|
| K-Nearest Neighbors | - |
| Decision Tree | - |
| Random Forest | - |
| **Naïve Bayes** | **98.6%** |
| SVM | - |

### Best Model — Naïve Bayes

| Class | Precision | Recall | F1-Score |
|---|---|---|---|
| FAILURE | 0.97 | 1.00 | 0.99 |
| NON_FAILURE | 1.00 | 0.97 | 0.99 |
| **Weighted Avg** | **0.99** | **0.99** | **0.99** |

---

## Deployment

- Built an interactive real-time prediction interface using **Gradio**
- Users can input sensor readings and receive instant failure predictions

---

## 📊 Model Monitoring

- Implemented post-deployment monitoring using **Evidently.ai**
- Tracked data drift and model performance degradation on new test data
- Validated model stability on a separate held-out test set

---

## Tech Stack

`Python` `SQL` `Pandas` `NumPy` `Scikit-learn` `Matplotlib` `Seaborn` 
`Gradio` `Evidently.ai` `Jupyter Notebook`

---

## Key Takeaways

- Naïve Bayes outperformed tree-based and distance-based models on this 
  sensor dataset
- Balanced precision and recall across both classes confirms the model 
  is reliable for real-world alerting
- Post-deployment monitoring ensures the model remains trustworthy as 
  new data arrives

# Customer Churn Analytics & Retention Insights

A data analytics project that explores customer churn, identifies high-risk customer segments, and translates customer data into actionable retention insights using SQL, Python, SQLite, machine learning, and an interactive dashboard.

## Overview

Customer churn occurs when customers discontinue a company's services. Understanding churn helps businesses investigate retention problems, identify vulnerable customer segments, and make better-informed decisions.

This project uses the Telco Customer Churn dataset, containing 7,043 customer records, to analyze churn patterns across customer characteristics, service subscriptions, contract types, and monthly charges.

The repository combines data preparation, SQL-based analysis, machine learning components, an API, and a browser-based dashboard.

## Business Objectives

- Measure the overall customer churn rate.
- Compare churn across contract types, tenure, payment methods, and service categories.
- Investigate the relationship between monthly charges and customer churn.
- Visualize important patterns through an interactive dashboard.
- Explore machine learning approaches for identifying customers at risk of churn.
- Translate analytical findings into potential customer-retention actions.

## My Contributions

### 1. SQL-Based Customer Segmentation

Added `queries/11_churn_by_monthly_charges.sql` to segment customers into three monthly-charge bands:

- Low: monthly charges below 35
- Medium: monthly charges from 35 up to, but not including, 70
- High: monthly charges of 70 or more

The query calculates the number of customers, churned customers, churn rate, and average monthly charges for each segment.

### 2. Dashboard Visualization

Added a Chart.js bar chart to `docs/dashboard.html` to visualize churn rates across the three monthly-charge bands.

The visualization helps users compare customer segments and identify areas that may deserve further investigation.

The chart currently displays a fixed snapshot of the SQL results rather than querying SQLite dynamically.

### 3. Data Validation and Analysis

Loaded 7,043 customer records into the local SQLite database and executed the additional SQL query to validate its results.

## Key Finding: Churn by Monthly Charge

| Monthly charge band | Customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| Low (<35) | 1,731 | 188 | 10.86% |
| Medium (35–69.99) | 1,721 | 407 | 23.65% |
| High (70+) | 3,591 | 1,274 | 35.48% |

The high-charge segment has a churn rate 24.62 percentage points above the low-charge segment.

This is an observed association, not evidence that higher charges directly cause churn. Contract type, service combinations, tenure, and other customer characteristics may also contribute to the pattern.

## Technology Stack

| Technology | Purpose |
|---|---|
| Python | Data preparation and analysis |
| Pandas and NumPy | Data manipulation and numerical operations |
| SQLite | Local analytical database |
| SQL | Aggregations, segmentation, and business queries |
| Scikit-learn and XGBoost | Machine learning components |
| FastAPI | Backend API |
| HTML and CSS | Dashboard structure and styling |
| JavaScript and Chart.js | Interactive charts and visualization |

## Project Structure

```text
customer-churn-analysis/
├── api/              # API application
├── data/             # Dataset and local database
├── docs/             # Browser-based dashboard
├── models/           # Model artifacts
├── notebooks/        # Exploratory analysis
├── queries/          # SQL business analysis
├── src/              # Data preparation and setup scripts
├── requirements.txt  # Python dependencies
├── README.md
└── .gitignore
```

## Getting Started

### Prerequisites

- Python 3.11 or a compatible supported Python version
- Git
- A web browser

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
cd YOUR_REPOSITORY_FOLDER
```

Replace the placeholder URL and folder name with your own repository details.

### 2. Create and activate a virtual environment

Windows PowerShell:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
```

### 3. Install dependencies

```powershell
python -m pip install -r requirements.txt
```

### 4. Prepare the data

Obtain the Telco Customer Churn dataset from Kaggle:

https://www.kaggle.com/datasets/blastchar/telco-customer-churn

Follow the repository's data-cleaning script and expected input paths to generate the cleaned dataset. Ensure `data/cleaned/telco_churn_cleaned.csv` exists before setting up the database.

```powershell
python src/data_cleaning.py
python src/setup_database.py
```

If the cleaned dataset is already available, run only the database setup step unless you need to regenerate it.

### 5. Run the API

```powershell
python -m uvicorn api.main:app --reload --port 8000
```

Open the interactive API documentation at:

http://localhost:8000/docs

### 6. Open the dashboard

Open `docs/dashboard.html` in your browser.

The added monthly-charge chart displays the SQL results as a fixed snapshot. Other dashboard features may use their own data and filtering logic.

### 7. Execute the additional SQL query

From the repository root:

```powershell
python -c "import sqlite3; q=open('queries/11_churn_by_monthly_charges.sql').read(); c=sqlite3.connect('data/churn.db'); [print(r) for r in c.execute(q)]; c.close()"
```

## Potential Future Enhancements

- Connect dashboard charts directly to database-backed API endpoints.
- Make all visualizations respond consistently to dashboard filters.
- Add cohort-based retention analysis using suitable time-based data.
- Improve model evaluation using precision, recall, ROC-AUC, and a confusion matrix.
- Add explainability to help interpret model predictions.
- Estimate the financial impact of targeted retention campaigns.
- Add automated tests for data preparation, SQL queries, and API responses.

## Attribution

This repository is an adaptation of **Customer Churn Analysis & Prediction** by Tharun Kumar Srinivasan.

Original repository:
https://github.com/Tharun-Design/customer-churn-analysis

My documented additions are the monthly-charge segmentation SQL query and its corresponding dashboard visualization. The underlying project components remain attributed to the original author. Refer to the original repository's license and preserve any applicable license and copyright notices.


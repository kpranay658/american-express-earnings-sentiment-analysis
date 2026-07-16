# 📊 American Express Earnings Call Sentiment Analysis (2022–2023)

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue?logo=postgresql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi)
![Hugging Face](https://img.shields.io/badge/HuggingFace-FinBERT-orange)
![License](https://img.shields.io/badge/License-MIT-green)

An end-to-end financial NLP project that analyzes **American Express (NYSE: AXP)** earnings call transcripts using **FinBERT**, stores processed insights in **PostgreSQL**, performs advanced **SQL analysis**, and visualizes business insights through an interactive **Power BI dashboard**.

---

# 📖 Overview

Financial earnings calls contain valuable information about a company's outlook, business performance, risks, and management confidence. This project leverages **FinBERT**, a transformer model trained specifically on financial text, to analyze quarterly earnings call transcripts from **2022–2023**.

The extracted sentiment scores are stored in PostgreSQL, analyzed using SQL, and visualized in Power BI to understand:

- Quarterly sentiment trends
- Executive confidence
- Dominant discussion topics
- Relationship between sentiment and stock price movement

---

# 🎯 Project Objectives

- Analyze earnings call transcripts using Financial NLP
- Measure Positive, Negative and Neutral sentiment
- Compare quarterly management sentiment
- Identify dominant discussion topics
- Analyze stock price movement alongside sentiment
- Build an executive-level interactive dashboard

---

# 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| Programming Language | Python |
| NLP Model | FinBERT (Hugging Face Transformers) |
| Database | PostgreSQL |
| Query Language | SQL |
| Dashboard | Microsoft Power BI |
| Notebook | Jupyter |
| Libraries | Pandas, NumPy, Transformers, Torch, Plotly |

---

# 📂 Project Structure

```text
american-express-earnings-sentiment-analysis/

├── assets/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── powerbi/
├── sql/
├── src/
├── README.md
├── requirements.txt
├── LICENSE
└── .gitignore
```

---

# ⚙️ Project Workflow

```text
Earnings Call Transcripts
            │
            ▼
      Data Cleaning
            │
            ▼
      Text Preprocessing
            │
            ▼
 FinBERT Sentiment Analysis
            │
            ▼
 Quarterly Sentiment Scores
            │
            ▼
     PostgreSQL Database
            │
            ▼
       SQL Analytics
            │
            ▼
    Power BI Dashboard
```

---

# 📊 Dashboard

### Executive Dashboard

<img width="1400" height="730" alt="Screenshot 2026-07-16 234143" src="https://github.com/user-attachments/assets/6bc08e21-8e92-44c2-84f8-d152b19552b7" />

<img width="1367" height="727" alt="Screenshot 2026-07-16 234211" src="https://github.com/user-attachments/assets/84318e6f-b27b-432e-a1d7-3eb6dd8383d9" />



---

### Dashboard Features

- Quarterly Sentiment Analysis
- Executive KPI Cards
- Positive vs Negative Sentiment Trends
- Sentiment vs Stock Price Analysis
- Topic Distribution
- Quarter Filter
- Executive Summary

---

# 🗄️ Database Schema

### quarterly_summary

| Column |
|----------|
| quarter |
| positive |
| negative |
| neutral |
| sentiment_label |
| dominant_topic |
| stock_change_pct |
| yoy_sentiment_change |

---

### topic_distribution

| Column |
|----------|
| quarter |
| topic_label |
| topic_mentions |

---

### sentiment_scores

| Column |
|----------|
| quarter |
| sentence |
| sentiment |
| confidence |

---

# 🔍 Example SQL Analysis

## Highest Negative Sentiment Quarter

```sql
SELECT
    quarter,
    negative,
    dominant_topic
FROM quarterly_summary
ORDER BY negative DESC
LIMIT 1;
```

---

## Quarterly Sentiment Trend

```sql
SELECT
    quarter,
    positive,
    negative,
    neutral
FROM quarterly_summary
ORDER BY quarter;
```

---

## Above Average Positive Sentiment

```sql
WITH avg_sentiment AS
(
SELECT AVG(positive) AS avg_positive
FROM quarterly_summary
)

SELECT *
FROM quarterly_summary
WHERE positive >
(
SELECT avg_positive
FROM avg_sentiment
);
```

---

# 📈 Key Insights

- Positive management sentiment improved significantly throughout 2023.
- Negative sentiment peaked during **Q4 2022**, reflecting macroeconomic uncertainty.
- Growth & Spending emerged as the most frequently discussed business topic.
- Higher positive sentiment generally aligned with stronger stock price performance.
- Executive confidence showed gradual recovery after periods of elevated negative sentiment.

---

# 🚀 Installation

Clone the repository

```bash
git clone https://github.com/<your-username>/american-express-earnings-sentiment-analysis.git
```

Move into the project directory

```bash
cd american-express-earnings-sentiment-analysis
```

Install dependencies

```bash
pip install -r requirements.txt
```

---

# ▶️ Running the Project

Run the notebooks in the following order:

```text
01_Data_Collection.ipynb

↓

02_Data_Preprocessing.ipynb

↓

03_FinBERT_Sentiment.ipynb

↓

04_PostgreSQL_Load.ipynb

↓

05_PowerBI_Preparation.ipynb
```

Open the Power BI dashboard from:

```text
powerbi/American_Express_Earnings.pbix
```

---

# 📌 Future Improvements

- Multi-company comparison
- Real-time earnings transcript analysis
- Speaker-level sentiment analysis
- LLM-generated executive summaries
- Predictive stock movement modeling
- Streamlit dashboard deployment
- Cloud-based data pipeline

---

# 📚 Libraries Used

- pandas
- numpy
- transformers
- torch
- nltk
- plotly
- matplotlib
- sqlalchemy
- psycopg2
- scikit-learn

---

# 🙏 Acknowledgements

- Hugging Face Transformers
- ProsusAI FinBERT
- PostgreSQL
- Microsoft Power BI
- Yahoo Finance
- SEC EDGAR

---

# 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Pranay Kumar**

If you found this project useful, feel free to ⭐ the repository and connect with me on LinkedIn.

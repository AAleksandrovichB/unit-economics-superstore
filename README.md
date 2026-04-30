# Unit Economics Analysis — Sample Superstore

## Overview
This project explores unit economics metrics using the Sample Superstore dataset.
The goal is to understand which customer segments generate the most value per order.

## Tools
- **DBeaver** — SQL queries and data extraction
- **Power BI** — dashboard design and visualization

## Metrics Analyzed
| Metric | Description |
|--------|-------------|
| AOV (Average Order Value) | Revenue per order |
| APC (Average Profit per Order) | Profit per order |
| CM Ratio | Contribution margin ratio (Profit / Revenue) |
| Avg Discount | Average discount rate per segment |

## Key Findings
- **Home Office** is the most efficient segment — highest AOV ($240.97), highest CM Ratio (0.14) and lowest average discount (14.7%)
- **Consumer** segment generates the most total revenue ($1.16M) but has the lowest margin (CM Ratio 0.12)
- There is a clear negative correlation between discount rate and margin across all segments

## Dashboard Preview
![Dashboard](export/dashboard.pdf)

## Files
```
├── sql/unit_economics.sql     # SQL query used for analysis
├── powerbi/dashboard.pbix     # Power BI dashboard file
└── export/dashboard.pdf       # Exported dashboard
```

## SQL Query
```sql
SELECT
    segment
   ,COUNT(*) AS qty_orders
   ,ROUND(SUM(sales), 2) AS total_sales
   ,ROUND(SUM(profit), 2) AS total_profit
   ,ROUND(SUM(sales) / COUNT(*), 2) AS AOV
   ,ROUND(SUM(profit) / COUNT(*), 2) AS APC
   ,ROUND(SUM(profit) / SUM(sales), 2) AS CM_ratio
   ,ROUND(AVG(discount), 3) AS avg_discount
FROM samplesuperstore
GROUP BY segment
ORDER BY CM_ratio DESC;
```

---

# Анализ юнит-экономики — Sample Superstore

## Описание
Проект посвящён анализу метрик юнит-экономики на основе датасета Sample Superstore.
Цель — определить, какой сегмент покупателей приносит наибольшую ценность в расчёте на один заказ.

## Инструменты
- **DBeaver** — написание SQL-запросов и выгрузка данных
- **Power BI** — построение дашборда и визуализация

## Анализируемые метрики
| Метрика | Описание |
|---------|----------|
| AOV (средний чек) | Выручка на один заказ |
| APC (прибыль на заказ) | Прибыль на один заказ |
| CM Ratio | Коэффициент маржинальности (Прибыль / Выручка) |
| Avg Discount | Средняя скидка по сегменту |

## Основные выводы
- **Home Office** — наиболее эффективный сегмент: наибольший AOV ($240.97), наибольший CM Ratio (0.14) и наименьшая средняя скидка (14.7%)
- **Consumer** генерирует наибольшую суммарную выручку ($1.16M), но имеет наименьшую маржу (CM Ratio 0.12)
- Прослеживается чёткая отрицательная корреляция между размером скидки и маржинальностью во всех сегментах

BrightCart Profitability Analysis

E-commerce profitability, sales channel performance, product returns,
and marketing ROI analysis using Excel, SQL, and Power BI.

Project Overview

BrightCart is an e-commerce business experiencing strong sales growth
while its profit margins are declining. This project investigates the
factors affecting profitability across product categories and sales
channels, examines the impact of product returns, and evaluates
marketing performance to identify opportunities for better business
decisions.

The analysis covers two years of sales and marketing data, eight product
categories, and four sales channels: Website, Mobile App, Marketplace,
and Social Commerce.

Project note: The figures and findings below are reported in the
project documentation. They should be interpreted in the context of
the calculations and assumptions used in the analysis.

Business Questions

Which product categories deliver the strongest and weakest profit
margins?

How do sales channels compare in profitability?

What impact do product returns have on revenue?

Which marketing platforms generate the strongest return on ad spend
(ROAS)?

Where could BrightCart review costs or reallocate resources to
improve profitability?

Tools

Excel --- data import, exploration, and validation

SQL --- querying and business analysis

Power BI --- DAX measures, KPIs, interactive dashboards, and
reporting

Figma --- listed as a project tool in the project documentation

Data Overview

The project documentation describes three main datasets:

Order-level transactions --- used to analyze sales, costs,
channels, and returns.

Product catalog --- provides product cost information across
eight product categories.

Monthly marketing spend --- supports analysis of advertising
expenditure and marketing performance.

Reported total marketing spend across the analysis period was
$503.51K.

The source datasets are not included in this repository at this stage.
Before adding data files, confirm that they can be shared publicly and
do not contain confidential, personal, or restricted information.

Workflow

Import and explore: Load the datasets into Excel and SQL and
understand their structure.

Data quality and cost checks: Check for missing values,
duplicates, inconsistencies, and validate order-level costs.

Business analysis: Query product profitability, sales channel
performance, return rates, and marketing effectiveness.

Power BI reporting: Create DAX measures and KPIs and build
interactive dashboard views.

Interpretation and recommendations: Summarize findings and
identify possible actions for improving profitability.

Key Findings

Product category profitability

Electronics recorded the highest reported profit margin at
approximately 31.13%.

Books recorded the lowest reported profit margin at approximately
11.94%.

Shipping costs were identified as a major factor reducing
profitability, particularly for Books.

Sales channel profitability

The Mobile App was reported as the most profitable channel, with an
average profit of 36 per order and a 30% profit margin.

Marketplace was reported as the least profitable channel, with an
average profit of 15 per order and a 13% profit margin.

High marketplace platform fees were identified as a key factor
affecting profitability.

Product returns

The reported overall return rate was 7.2%.

Returns were associated with approximately $24.98K in lost
revenue impact.

Electronics and Books had the highest reported return rates.

Marketplace had the lowest reported return rate but remained the
least profitable channel, suggesting that returns alone do not
explain its weaker profitability.

Marketing performance

TikTok Ads recorded the highest reported average ROAS at 24.4.

Influencer Marketing followed at 23.4.

Email Marketing recorded the lowest reported average ROAS at
5.4.

The project documentation proposes reviewing lower-performing spend
and evaluating opportunities to reallocate budget toward
stronger-performing platforms.

Recommendations

Based on the reported findings, the project recommends that BrightCart:

Review shipping rates and packaging practices, particularly for
low-margin categories.

Reassess pricing and minimum order thresholds where appropriate.

Review marketplace platform fees and the profitability of
marketplace sales.

Investigate the causes of returns in Electronics and Books and
improve product information and packaging where needed.

Evaluate marketing spend by platform and test reallocations toward
higher-ROAS channels.

Monitor profitability and return on ad spend over time before making
permanent budget changes.

These are recommendations for consideration, not confirmed savings or
outcomes already achieved.

Dashboard and Documentation

Power BI dashboard:
dashboard/BrightCart_Profitability_Dashboard.pbix

Project documentation:
documentation/BrightCart_Profitability_Analysis.pdf

Dashboard screenshots: screenshots/

The paths above describe the intended repository structure. Add the
corresponding files as they are prepared.

Limitations and Interpretation

The findings in this README are based on the project's accompanying
documentation.

The reported $24.98K figure is described as a lost revenue
impact associated with returns; it should not be interpreted as
lost profit unless the underlying calculations support that
interpretation.

ROAS comparisons should be interpreted using the project's specific
calculation method and attribution assumptions.

Recommendations such as a proposed marketing budget reduction are
strategies to evaluate, not realized savings.

The underlying figures should be checked against the Power BI
measures and source data before being treated as independently
verified results.

Project Objective

This project demonstrates an end-to-end analytical workflow: translating
a business problem into analytical questions, preparing and checking
data, analyzing profitability and marketing performance, presenting
results in Power BI, and communicating practical recommendations.# BrightCart-Profitability-Analysis
E-commerce profitability, sales channel performance, returns, and marketing ROI analysis using SQL and Power BI.

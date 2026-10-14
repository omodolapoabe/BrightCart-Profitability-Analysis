
USE E_commerce;

SELECT * FROM marketing_spend

SELECT * FROM products;

SELECT * FROM orders;


/* Q1: What is the average profit margin by product category?
		Which categories are the most and least profitable, and what is driving the difference? */

SELECT 
    primary_category,
    ROUND(SUM(profit)/SUM(net_revenue) * 100, 2) AS profit_margin,
    ROUND(SUM(product_cost)/SUM(gross_revenue) * 100, 2) AS total_product, 
    ROUND(SUM(shipping_cost)/SUM(gross_revenue) * 100,2) AS total_shippingCost,
    ROUND(SUM(refund_amount)/SUM(gross_revenue) * 100,2) AS total_refund,
    ROUND(SUM(discount_amount)/SUM(gross_revenue) * 100,2) AS total_discount
FROM orders
GROUP BY primary_category
ORDER BY 2 DESC; -- Books has the least profit margin because of it highest shipping cost.

/* Q2: How does profitability differ across sales channel. 
		Which channel has the best and the worst profit per order after accounting for platform fee. */

SELECT
    channel,
    COUNT(*)                                               AS order_count,
    ROUND(SUM(gross_revenue), 2)                           AS total_gross_revenue,
    ROUND(SUM(profit), 2)                                  AS total_profit,
    ROUND(AVG(profit), 2)                                  AS avg_profit_per_order,
    ROUND(SUM(profit) / SUM(net_revenue) * 100, 0)         AS profit_margin_pct,
    ROUND(AVG(platform_fee), 2)                            AS avg_platform_fee_per_order,
    ROUND(SUM(platform_fee), 2)                            AS total_platform_fees
FROM orders
GROUP BY channel
ORDER BY avg_profit_per_order DESC;

/*  DRIVER: platform_fee is $0 on Website/Mobile App (owned channels) and
   averages $9.87-$18.97 on Social Commerce/Marketplace (third-party
   channels). That fee gap alone explains almost the entire profitability
   spread between "best" and "worst" channel -- it isn't a return-rate story
   (Marketplace actually has the LOWEST return rate at 6.4%). */

-- Q3: What is the return rate by category and channel? 
-- Estimate how much total revenue was lost to returns over the analysis period.(kpi)

WITH channel_CTE AS(
SELECT 
    primary_category,
    channel,
    ROUND(SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) * 100 /COUNT(*),1)  AS return_rate
FROM
    orders
GROUP BY 1, 2
ORDER BY return_rate DESC)
	SELECT 
		primary_category,
		SUM(CASE WHEN channel = 'Social Commerce' THEN return_rate END) AS 'Social Commerce',
		SUM(CASE WHEN channel = 'Marketplace' THEN return_rate END) AS 'Marketplace',
		SUM(CASE WHEN channel = 'Website' THEN return_rate END) AS 'Website',
		SUM(CASE WHEN channel = 'Mobile App' THEN return_rate END) AS 'Mobile App'
	FROM channel_CTE
    GROUP BY primary_category;

-- Q4: Analyze the marketing spend data: 
-- Which advertising platform delivers the best ROAS (Return on Ad Spend)? 

SELECT
    platform,
    SUM(cpa)                                                 AS total_cpa,
    ROUND(SUM(spend), 2)                                     AS total_spend,
    ROUND(SUM(revenue_attributed), 2)                        AS total_revenue_attributed,
    ROUND(SUM(revenue_attributed) / NULLIF(SUM(spend),0), 2) AS overall_roas,
    ROUND(AVG(roas), 2)                                      AS avg_monthly_roas,
    SUM(conversions)                                         AS total_conversions,
    ROUND(SUM(spend) / SUM(conversions), 2)              AS blended_cpa
FROM marketing_spend
GROUP BY platform
ORDER BY overall_roas DESC;

-- Are there any platforms where the company is spending money but not getting a positive return?    

SELECT month, platform, spend, revenue_attributed, roas
FROM marketing_spend
WHERE roas < 1
ORDER BY roas ASC;

/* RESULT (tested):
   TikTok Ads       24.0x overall ROAS  (best)   $57,229 total spend
   Influencer       22.7x                        $97,663 total spend
   Instagram Ads    15.7x                         $65,154 total spend
   Google Ads       14.4x                        $152,546 total spend (BIGGEST budget, only 4th best ROAS)
   Facebook Ads     11.5x                        $106,452 total spend
   Email Marketing   4.8x overall ROAS  (worst)    $24,461 total spend

   Only ONE platform-month lost money outright: Email Marketing,
   December 2025 (spent $1,796.66, generated $1,198.99 -> ROAS 0.67x).
   Every other platform-month, even in weak platforms, stayed above 1.0x. */





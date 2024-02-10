/*Data Overview 
Total product  is 3179
*/
select count(*) from info_v2;


/*Missing Value*
*/

SELECT COUNT(*) AS total_rows,
COUNT(info_v2.description) AS count_description,
COUNT(finance.listing_price) AS count_listing_price,
COUNT(traffic_v3.last_visited) AS count_last_visited,
COUNT(brands_v2.brand) as count_brand
FROM info_v2
INNER JOIN finance
ON info_v2.product_id = finance.product_id
INNER JOIN traffic_v3
ON info_v2.product_id = traffic_v3.product_id
INNER JOIN brands_v2
on info_v2.product_id= brands_v2.product_id;


/*lisitng price*/

SELECT brand, listing_price , count(*) AS count
FROM finance
INNER JOIN brands_v2
ON finance.product_id = brands_v2.product_id
WHERE listing_price > 0
GROUP BY brand, listing_price
ORDER BY listing_price DESC;

/*Addidas vs Nike*/
select brand , 
count(brands_v2.product_id) as brand_unit,
sum(discount),
sum(revenue)
from finance
inner join brands_v2
on finance.product_id=brands_v2.product_id
group by brand;


/*labelling price*/
SELECT brand, count(*), sum(revenue) AS total_revenue,
CASE WHEN listing_price < 42 THEN 'Budget'
     WHEN listing_price >= 42 AND listing_price < 74 THEN 'Average'
     WHEN listing_price >= 74 AND listing_price < 129 THEN 'Expensive'
     ELSE 'Elite' END AS price_category
FROM finance
INNER JOIN brands_v2
ON finance.product_id = brands_v2.product_id
WHERE brand IS NOT NULL
GROUP BY brand, price_category
ORDER BY total_revenue DESC;


/*Revenue and Review*/
select revenue,reviews 
from finance 
inner join reviews_v2
on finance.product_id = reviews_v2.product_id
order by revenue desc; 

/*reviews by month*/
SELECT brand, 
month(last_visited) as months,
COUNT(reviews) as num_reviews
FROM reviews_v2
INNER JOIN traffic_v3
ON reviews_v2.product_id = traffic_v3.product_id
INNER JOIN brands_v2
ON reviews_v2.product_id = brands_v2.product_id
GROUP BY brand, months
HAVING brand IS NOT NULL
AND months IS NOT NULL
ORDER BY brand, months;






/*Footwear product performance*/
SET @rowindex := -1;

WITH footwear AS
(
    SELECT i.description, f.revenue,
   @rowindex := @rowindex + 1 AS rowindex
    FROM info_v2 AS i
    INNER JOIN finance AS f 
        ON i.product_id = f.product_id
    WHERE i.description LIKE '%shoe%'
        OR i.description LIKE '%trainer%'
        OR i.description LIKE '%foot%'
        AND i.description IS NOT NULL
)

SELECT COUNT(*) AS num_footwear_products, sum(revenue) 
from footwear;


/*Clothes products performance*/
With cte as 
(
SELECT i.description, f.revenue
    FROM info_v2 AS i
    INNER JOIN finance AS f 
        ON i.product_id = f.product_id
    WHERE i.description LIKE '%shoe%'
        OR i.description LIKE '%trainer%'
        OR i.description LIKE '%foot%'
        AND i.description IS NOT NULL
)
SELECT count(*) AS num_clothing_products,sum(revenue)
FROM info_v2
INNER JOIN finance
ON info_v2.product_id = finance.product_id
WHERE description NOT IN (SELECT description from cte);







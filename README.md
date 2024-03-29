# SQL
<br>
Sports clothing and athleisure attire is a huge industry, worth approximately $193 billion in 2021 with a strong growth forecast over the next decade!

In this notebook, we play the role of a product analyst for an online sports clothing company. The company is specifically interested in how it can improve revenue. We will dive into product data such as pricing, reviews, descriptions, and ratings, as well as revenue and website traffic, to produce recommendations for its marketing and sales teams.

The database provided to us, sports, contains five tables, with product_id being the primary key for all of them:
<br>
tables:
<br>
info_v2
<br>
column	          data type	      description
<br>
product_name	    varchar	       Name of the product
<br>
product_id	      varchar	       Unique ID for product
<br>
description	       varchar	      Description of the product

finance
<br>
product_id	            varchar	                   Unique ID for product
<br>
listing_price	          float	                     Listing price for product
<br>
sale_price	           float	                     Price of the product when on sale
<br>

discount	              float	                        Discount, as a decimal, applied to the sale price
<br>
revenue               	float	                               Amount of revenue generated by each product, in US dollars

<br>


reviews
<br>
column	        data            type	description
<br>
product_name	     varchar	       Name of the product
<br>
product_id	        varchar	         Unique ID for product
<br>
rating	             float	        Product rating, scored from 1.0 to 5.0
<br>
reviews	float	Number of reviews for the product
<br>

traffic
<br>
column	data type	description
<br>
product_id	varchar	Unique ID for product
<br>
last_visited	timestamp	Date and time the product was last viewed on the website
<br>
brands
<br>
column	data type	description
<br>
product_id	varchar	Unique ID for product
<br>
brand	varchar	Brand of the product
<br>


Lets Analyze the data 

<br>
1. Missing values: The data has a total 3179 products out of 3120 are null values and 59 values are missing. Of the columns we previewed, only one — last_visited — is missing more than five percent of its values. 
<br>

2.Now let's turn our attention to pricing. How do the price points of Nike and Adidas products differ? Answering this question can help us build a picture of the company's stock range and customer market.It turns out there are 77 unique prices for the products in our database,
<br>

3.To understand revenue better, let's take a look at the discount, which is the percent reduction in the listing_price when the product is actually sold. How Nike and Addidas products performed.
Strangely, no discount is offered on Nike products! In comparison, not only do Adidas products generate the most revenue, but these products are also heavily discounted and heavily sold.

<br>

4. Let's build  labels to different price ranges, grouping by brand and label. We will also include the total revenue for each price range and brand.Interestingly, grouping products by brand and price range allows us to see that Adidas items generate more total revenue regardless of price category! Specifically, "Elite" Adidas products priced $129 or more typically generate the highest revenue, so the company can potentially increase revenue by shifting their stock to have a larger proportion of these products!
<br>
To improve revenue further, the company could try to reduce the amount of discount offered on Adidas products, and monitor sales volume to see if it remains stable. Alternatively, it could try offering a small discount on Nike products. This would reduce average revenue for these products, but may increase revenue overall if there is an increase in the volume of Nike products sold.
<br>

5.Interestingly, there is a strong positive correlation between revenue and reviews. This means, potentially, if we can get more reviews on the company's website, it may increase sales of those items with a larger number of reviews.
<br>

6.Looks like product reviews are highest in the first quarter of the calendar year, so there is scope to run experiments aiming to increase the volume of reviews in the other nine months!
<br>

7. Footwear product performance:we found there are 3,117 products without missing values for description. Of those, 2,700 are footwear products, which account for around 85% of the company's stock. They also generate a median revenue of over $3000 dollars!
<br>

8. Out of 3117 total products,430 products are clothing products which generate revenue 954201.01 i.e over 7% percent of total revenue.










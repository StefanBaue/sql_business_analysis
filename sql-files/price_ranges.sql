/* ### Price ranges overall ### */

/* Eniac figures 

April 2017 - March 2018
Revenue:              €14M
Avg. monthly revenue: €1.17M
Avg. order price:     €710
Avg. item price:      €540
*/

### Magist order prices
### type          avg price
### Per Order       137.75
### Per Order Item  120.65

/* ### main query ### */
select 'Per Order' `type`, round(min(order_sum),2) 'min price', round(max(order_sum),2) 'max price', round(avg(order_sum),2) 'avg price' from (select order_id, sum(price) order_sum from order_items group by order_id) sub
union
select 'Per Order Item' `type`, round(min(price),2), round(max(price),2), round(avg(price),2) from order_items;
/* ### main query ### */

select min(price), max(price), avg(price) from order_items;

select * from order_items o;
select count(order_id) from order_items;                        -- 112650

/* ### compared to avg. order price ### */
select count(order_id) from order_items o where o.price <710;  -- 110916
  select concat(110916 / 112650 * 100,'%') precentage_low_price_stuff_710; -- 98.4607%
select count(order_id) from order_items o where o.price >710;  -- 1734
  select concat(1734 / 112650 * 100,'%') precentage_high_price_stuff_710; -- 1.5393%

/* ### compared to avg. item price ### */
select count(order_id) from order_items o where o.price <540;  -- 109705
  select concat(109705 / 112650 * 100,'%') precentage_low_price_stuff_540; -- 97.3857%
select count(order_id) from order_items o where o.price >540;  -- 2935
  select concat(2935 / 112650 * 100,'%') precentage_high_price_stuff_540; -- 2.6054%

select count(distinct product_id) from order_items o; -- 32951

select 'Per Order' `type`, min(order_sum) 'min price', max(order_sum) 'max price', avg(order_sum) 'avg price' from (select order_id, sum(price) order_sum from order_items group by order_id) sub
union
select 'Per Order Item' `type`,min(price), max(price), avg(price) from order_items;

select order_id from order_items o group by order_id having sum(price) > 13000 ;
select * from order_items where order_id ='03caa2c082116e1d31e67e9ae3700499';

#################################################################################
select count (order_id) from order_items oi where oi.price

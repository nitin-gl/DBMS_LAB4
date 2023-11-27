DELIMITER $$
USE `a_test`$$
CREATE PROCEDURE `supplier_rat` ()
BEGIN
	select report.SUPP_ID, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
	WHEN report.Average >4 THEN 'Good Service'
	WHEN report.Average >2 THEN 'Average Service'
	ELSE 'Poor Service'
END AS Type_of_Service from
 (
	select test2.supp_id, avg(rat_ratstars) as Average from
	(
		select sp.SUPP_ID,t1.ord_id,t1.rat_ratstars from supplier_pricing as sp
		inner join
		(
			select o.PRICING_ID, rat.ORD_ID , rat.RAT_RATSTARS from `order` as o
			inner join 
			rating as rat on o.ORD_ID = rat.ORD_ID
		) as t1 on sp.PRICING_ID =t1.pricing_id
	) as test2 group by test2.SUPP_ID
) as report;
END$$

DELIMITER ;
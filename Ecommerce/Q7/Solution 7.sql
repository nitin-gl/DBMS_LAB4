#Display the Id and Name of the Product ordered after “2021-10-05”.
select p.PRO_ID, p.PRO_NAME from product as p
inner join
(
select O.*,sp.PRO_ID from `order` as O
inner join
supplier_pricing as sp
on sp.PRICING_ID = O.PRICING_ID and ORD_DATE>"2021-10-05"
) as q
on q.PRO_ID = p.PRO_ID
;

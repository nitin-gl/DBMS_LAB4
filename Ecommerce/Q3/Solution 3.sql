SELECT count(T2.CUS_GENDER) as No_of_customer, T2.CUS_GENDER as Gender from 
(
select T1.CUS_ID, T1.CUS_GENDER, T1.CUS_NAME,T1.ORD_AMOUNT FROM
(
select O.* , C.CUS_NAME, C.CUS_GENDER from `order` as O
inner join
customer as C 
on C.CUS_ID = O.CUS_ID
having O.ORD_AMOUNT>3000)
as T1
)
AS T2 group by T2.CUS_GENDER;
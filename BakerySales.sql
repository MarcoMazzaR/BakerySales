use BakerySales

select article, Quantity from ['Bakery sales$']
where ticket_number = 2196000

select count(distinct ticket_number) as Ticket from ['Bakery sales$']
where Quantity > 0

select ticket_number, sum (Quantity) as 'Cantidad Articulos Vendidos' from ['Bakery sales$']
where Quantity > 0
group by ticket_number
order by [Cantidad Articulos Vendidos] desc -- Mayores ventas en cuanto a Articulos.-


select ticket_number, sum(unit_price) as 'Revenue' from ['Bakery sales$']
where Quantity > 0 
group by ticket_number
order by Revenue Desc --Mayores ventas en cuanto a Ganancias

select ticket_number, article, unit_price, sum(unit_price) as 'Revenue' from ['Bakery sales$']
where ticket_number = 2646920
group by ticket_number, article, unit_price


select distinct (article), count(ticket_number) as 'Ventas', unit_price, sum(unit_price) as 'Revenue' from ['Bakery sales$']
where year = 2021
group by article, unit_price
order by Revenue desc --VENTAS DE 2021

select article, count(ticket_number) as 'Ventas', unit_price, sum(unit_price) as 'Revenue' from ['Bakery sales$']
where year = 2022
group by article, unit_price
order by Revenue desc --VENTAS DE 2022


select [AM/PM], round(sum(unit_price),2) as 'Revenue' from ['Bakery sales$']
group by [AM/PM] --A la mañana se vende más

select Month, count(article) as 'Ventas', article , round(sum(unit_price),2) as 'Revenue' from ['Bakery sales$']
where year = 2021 and Quantity > 0
group by Month, article
order by Revenue desc

select Month, count(article) as 'Ventas', article, round(sum(unit_price),2) as 'Revenue' from ['Bakery sales$']
where year = 2022 and Quantity > 0
group by Month, article
order by Revenue desc

select distinct(article), round (sum(unit_price), 2) as 'Revenue' from ['Bakery sales$']
group by article
order by Revenue desc



select Hora, sum(quantity) as Compras, Year as Año from ['Bakery sales$']
group by Year, Hora
order by Año, Compras desc --HORARIO CON MAYOR CANTIDAD DE COMPRAS



------------QUERIES EN BASE A MAÑANA/TARDE-----------


select distinct article,Hora, count(ticket_number) as Compras, Year as Año from ['Bakery sales$']
where Hora <= 12 and Year = 2021
group by Year, Hora, article
order by Año, Compras desc --CANTIDAD DE COMPRAS A LA MAÑANA EN 2021

select Hora, count(ticket_number) as Compras, Year as Año from ['Bakery sales$']
where Hora > 12 and Year = 2021
group by Year, Hora
order by Año, Compras desc --CANTIDAD DE COMPRAS A LA TARDE EN 2021

select DISTINCT Hora, count(ticket_number) as Compras, Year as Año from ['Bakery sales$']
where Hora <= 12 and Year = 2022
group by Year, Hora, article
order by Año, Compras desc --CANTIDAD DE COMPRAS A LA MAÑANA EN 2022

select Hora, count(ticket_number) as Compras, Year as Año from ['Bakery sales$']
where Hora > 12 and Year = 2022
group by Year, Hora
order by Año, Compras desc --CANTIDAD DE COMPRAS A LA TARDE EN 2022

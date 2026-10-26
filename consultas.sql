-- 1. Quantos clientes há em cada estado?
select estado,
    count(*) as total_clientes
from clientes
group by estado;
-- 2. Quantos pedidos cada cliente fez?
select nome,
    count(*) as pedidos_total
from clientes
    join pedidos on clientes.id = pedidos.cliente_id
group by nome;
-- 3. Qual cliente fez mais pedidos?
select nome,
    count(*) as pedidos_total
from clientes
    join pedidos on clientes.id = pedidos.cliente_id
group by nome
order by pedidos_total Desc
limit 1;
-- 4. Quais pedidos atrasaram?
select id,
    data_prevista,
    data_entrega
from pedidos
where data_entrega > data_prevista;
-- 5. Quantos dias cada pedido atrasado atrasou?
select id,
    data_prevista,
    data_entrega,
    data_entrega - data_prevista as dias_atrasos,
    data_entrega - data_pedido as tempo_entrega
from pedidos
where data_entrega > data_prevista;
-- 6. Quais pedidos ainda não foram entregues?
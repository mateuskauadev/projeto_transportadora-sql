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
select id,
    data_pedido,
    data_entrega
from pedidos
where data_entrega is null;
--7. Quantos pedidos cada caminhão levou? Inclua o que não levou nenhum
select caminhoes.placa,
    count(pedidos.caminhao_id) as pedidos
from caminhoes
    left join pedidos on caminhoes.id = pedidos.caminhao_id
group by caminhoes.placa;
-- 8. Qual o valor total de cada pedido?
select pedidos.id,
    sum(itens_pedidos.quantidade * produtos.preco) as valor_total
from pedidos
    join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
    join produtos on produtos.id = itens_pedidos.produto_id
group by pedidos.id
order by pedidos.id;
-- 9.Qual o peso total de cada pedido? Algum passou da capacidade do caminhão?
select pedidos.id,
    caminhoes.placa,
    caminhoes.capacidade_kg,
    sum(itens_pedidos.quantidade * produtos.peso_kg) as peso_total
from pedidos
    join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
    join produtos on produtos.id = itens_pedidos.produto_id
    join caminhoes on caminhoes.id = pedidos.caminhao_id
group by pedidos.id,
    caminhoes.placa,
    caminhoes.capacidade_kg
having sum(itens_pedidos.quantidade * produtos.peso_kg) > caminhoes.capacidade_kg
order by pedidos.id;
-- 10. Qual produto foi mais vendido em quantidade?
select produtos.id,
    produtos.nome,
    sum(itens_pedidos.quantidade) as total
from produtos
    join itens_pedidos on produtos.id = itens_pedidos.produto_id
group by produtos.id,
    produtos.nome
order by total desc
limit 1;
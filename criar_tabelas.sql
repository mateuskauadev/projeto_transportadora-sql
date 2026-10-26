drop table if exists itens_pedidos;
drop table if exists pedidos;
drop table if exists clientes;
drop table if exists caminhoes;
drop table if exists produtos;
create table clientes(
    id serial primary key,
    nome varchar(100),
    cidade Varchar(100),
    estado char(2)
);
create table caminhoes(
    id serial primary key,
    placa char(7) unique,
    capacidade_kg int
);
create table produtos(
    id serial primary key,
    nome varchar(100),
    peso_kg decimal(10, 2),
    preco decimal(10, 2)
);
create table pedidos(
    id serial primary key,
    cliente_id int references clientes(id),
    caminhao_id int references caminhoes(id),
    data_pedido date,
    data_prevista date,
    data_entrega date
);
create table itens_pedidos(
    pedido_id int references pedidos(id),
    produto_id int references produtos(id),
    quantidade int
);
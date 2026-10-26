insert into clientes (nome, cidade, estado)
values ('Mercado Bom Preço', 'Rio de Janeiro', 'RJ'),
    ('Farmácia Saúde Já', 'Niterói', 'RJ'),
    ('Construmax Materiais', 'São Paulo', 'SP'),
    ('Loja Casa Bela', 'Belo Horizonte', 'MG'),
    ('Distribuidora Sul', 'Curitiba', 'PR');
insert into caminhoes(placa, capacidade_kg)
values ('RJO1A23', 1000),
    ('SPA4B56', 3000),
    ('MGB7C89', 8000);
insert into produtos(nome, peso_kg, preco)
values ('caixa de parafusos', 2.50, 35.90),
    ('Furadeira', 1.80, 249.00),
    ('Saco de cimento', 50.00, 39.90),
    ('Galão de tinta', 18.00, 189.00),
    ('Caixa de remédios', 0.50, 120.90),
    ('Fardo de arroz', 30.00, 145.00);
insert into pedidos(
        cliente_id,
        caminhao_id,
        data_pedido,
        data_prevista,
        data_entrega
    )
values (1, 1, '2026-09-01', '2026-09-05', '2026-09-04'),
    (1, 2, '2026-09-03', '2026-09-08', '2026-09-10'),
    (2, 1, '2026-09-05', '2026-09-09', '2026-09-09'),
    (3, 2, '2026-09-10', '2026-09-15', '2026-09-20'),
    (1, 1, '2026-09-12', '2026-09-16', '2026-09-15'),
    (4, 2, '2026-09-15', '2026-09-22', '2026-09-21'),
    (5, 2, '2026-09-18', '2026-09-25', '2026-09-29'),
    (3, 1, '2026-09-20', '2026-09-24', '2026-09-24'),
    (2, 2, '2026-10-01', '2026-10-06', '2026-10-05'),
    (1, 2, '2026-10-20', '2026-10-27', null);
insert into itens_pedidos (pedido_id, produto_id, quantidade)
values (1, 1, 10),
    (1, 2, 2),
    (2, 3, 20),
    (2, 4, 5),
    (3, 5, 30),
    (4, 3, 40),
    (4, 1, 15),
    (5, 3, 25),
    (5, 1, 5),
    (6, 4, 10),
    (6, 2, 3),
    (7, 6, 20),
    (7, 1, 8),
    (8, 2, 4),
    (8, 5, 10),
    (9, 5, 25),
    (9, 6, 5),
    (10, 6, 30),
    (10, 4, 6),
    (10, 1, 12);
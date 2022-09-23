use ecommerce;

-- table clients (idClient, Fname, Minit, Lname, CPF, BirthDate, Street, StreetName, Complement, District, City, State, PostalCode)
insert into clients (Fname, Minit, Lname, CPF, BirthDate, Street, StreetName, Complement, District, City, State, PostalCode) values
			('Adão','H','Genesis',12345678912,'1000-01-01','Jardim do Edén',1,'Cs1','JD Eden','Paraíso','CE',11111000),
            ('Eva','M','Genesis',11122233344,'1000-08-01','Jardim do Edén',1,'Cs1','JD Eden','Paraíso','CE',11111000),
            ('Abraão','P','Fé',22233344411,'1500-06-25','Rua Sodoma e Gomorra',12,'Leite','Mel','Terra','CN',012345678),
            ('Moíses','E','Libertador',33344455566,'1830-05-12','Avenida Mar Vermelho',415,'tenda 8','Leite e mel','Prometida','EG',22233322),
            ('Davi','R','Israel',44455566677,'1998-11-30','Estrada de Saul',8,'templo 5','Betseba','Jerusalém','IR',33322244);

-- table product (idProduct, Pname, Classification_kids, Category('Eletrônico', 'Vestimenta', 'Brinquedos', 'Papelaria', 'Utensilios')
-- DescriptionProduct, Evaluation, Size)
insert into product (Pname, Classification_kids, Category, DescriptionProduct, Evaluation, Size) value
			('Caneta',default,'Papelaria','Produto na cor azul',5.0,null),
            ('Tablet',default,'Eletrônico','Android 4.0',5.0,null),
            ('Túnica',default,'Vestimenta','Color',4.0,'1.80x0.90'),
            ('Carrinho',0,'Brinquedos',null,5.0,null),
            ('Vaso de alabastro',default,'Utensilios','Barro do monte',4.5,null);

-- table payments (idClient, idPayment, typePayment('Boleto', 'Cartão','Pix'), limitAvailable, dataValid)


-- table request (idRequest,  idRequestClient, requestStatus('Cancelado','Confirmado','Em processamento'), requestDescription, sendValue, paymentCash)
insert into request (requestStatus, requestDescription, sendValue, paymentCash) values
					('Confirmado','Aceito',1.80,true),
                    ('Cancelado','Pagamento não efetuado',55.90,false),
                    ('Em Processamento','Aguardando confirmação',299.99,true),
                    ('Confirmado','Aceito',1.80,true),
                    (default,'Aceito',80.7,false);

-- table productStorage (idProdStorage, storageLocation, quantity)
insert into productStorage (storageLocation, quantity) values
	('Corredor C',47),
    ('Corredor A',25),
    ('Corredor C',default),
    ('Corredor B',9),
    ('Corredor E',1);

-- table supplier (idSupplier, SocialName, CNPJ, AbstractName, Contact, Street, StreetNumber, Complement, District, City, State, PostalCode)
insert into supplier (SocialName, CNPJ, AbstractName, Contact, Street, StreetNumber, Complement, District, City, State, PostalCode) values
	('Vendas A',123456789101112,'Canetas',1122222333,'rua 1',100,'cs1','jardim 1','city1','ES',12123000),
    ('Vendas B',234567891011121,'Tabuas',22333445657,'rua 2',10,'cs9','jardim 2','city2','ES',10002223),
    ('Vendas C',345678910111213,'Tecidos',33222111445,'rua 3',1,'cs5','jardim 3','city3','ES',11111122),
    ('Vendas D',456789101112131,'Carrinhos',44455566678,'rua 4',25,'cs2','jardim 4','city4','ES',22222245),
    ('Vendas E',567891011121314,'Vasos',55566677789,'rua 5',23,'cs6','jardim 5','city5','ES',33333366);

-- table seller (idSeller, SocialName, CNPJ, CPF, AbstractName, Contact, Street, StreetNumber, Complement, District, City, State, PostalCode)
insert into seller (SocialName, CNPJ, CPF, AbstractName, Contact, Street, StreetNumber, Complement, District, City, State, PostalCode) values
	('Vendedor A',123456789012345,null,'Vendo muito 1',88888777444,'rua 6',320,'apto 1','Parque 1','cidade1','CN',11122236),
    ('Vendedor B',234567890123456,null,'Vendo muito2',66514587452,'rua 18',320,'apto 5','Parque 2','cidade2','CN',22334567),
    ('Vendedor C',null,75395145682,'Vendo muito 3',11598745632,'rua 9',320,'apto 9','Parque 3','cidade3','CN',33221145),
    ('Vendedor D',456789012345678,null,'Vendo muito 4',22369887452,'rua 7',320,'apto 7','Parque 4','cidade4','CN',33669988),
    ('Vendedor E',null,15975369874,'Vendo muito 5',33258741023,'rua 12',320,'apto 4','Parque 5','cidade5','CN',44556677);
    
-- table productSeller (idPseller, idPproduct, ProdQuantity)
insert into productSeller (idPseller, idPproduct, ProdQuantity) values 
	(1,1,10),
    (2,2,15),
    (3,3,9),
    (4,4,25),
    (5,5,6);

-- table productRequests (idPRrequest, idPRproduct, PRQuantity, PRStatus('Disponível','Sem estoque'))
insert into productRequests (idPRrequest, idPRproduct, PRQuantity, PRStatus) values
	(1,1,11,'Disponível'),
    (2,2,0, 'Sem Estoque'),
    (3,3,9, default),
    (4,4,0, 'Sem Estoque'),
    (5,5,6, default);

-- table storageLocation (idLproduct, idLstorage, location)
insert into storageLocation (idLproduct, idLstorage, location) values
	(1,1,'Local A'),
    (2,2, 'Local N'),
    (3,3, 'Local M'),
    (4,4,'Local D'),
    (5,5, 'Local C');
-- table productSupllier (idPsSupplier, idPsProduct, quantity) 
insert into productSupllier (idPsSupplier, idPsProduct, quantity) values 
	(1,1,10),
    (2,2,15),
    (3,3,9),
    (4,4,25),
    (5,5,6);
    

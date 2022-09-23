-- Criação do banco de dados
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients (
	idClient int auto_increment primary key,
    Fname varchar(10) not null,
    Minit char(3),
    Lname varchar(20) not null,
    CPF char(11) not null,
    Street varchar(30) not null,
    StreetName int(5) not null,
    Complement varchar(10),
    District varchar(30) not null,
    City varchar(30) not null,
    State char(2) not null,
    PostalCode char(8) not null,
    constraint unique_cpf_client unique(CPF)
);

alter table clients auto_increment=1;

-- criar tabela produto
create table product (
	idProduct int auto_increment primary key,
    Pname varchar(30) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Papelaria', 'Utensilios') not null,
    DescriptionProduct varchar(45),
    Evaluation float default 0,
    Size varchar(10)
);

alter table product auto_increment=1;

-- criar tabela pagamento
create table payments (
	idClient int,
    idPayment int,
    typePayment enum('Boleto', 'Cartão','Pix'),
    limitAvailable float,
    dataValid date,
    primary key (idClient, idPayment)
);

-- criar tabela pedido
create table request (
	idRequest int auto_increment primary key not null,
    idRequestClient int,
    requestStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    requestDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_request_client foreign key (idRequestClient) references clients (idClient)
			on update cascade 
);

alter table request auto_increment=1;

-- criar tabela estoque
create table productStorage (
	idProdStorage int auto_increment primary key, 
    storageLocation varchar(255),
    quantity int default 0
);

alter table productStorage auto_increment=1;

-- criar tabela fornecedor
create table supplier (
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    AbstractName varchar(255),
    Contact char(11) not null,
    Street varchar(30) not null,
    StreetNumber int(5) not null,
    Complement varchar(10),
    District varchar(30) not null,
    City varchar(30) not null,
    State char(2) not null,
    PostalCode char(8) not null,
    constraint unique_cnpj_supplier unique(CNPJ)
);

alter table supplier auto_increment=1;

-- criar tabela vendedor
create table seller (
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    AbstractName varchar(255),
    Contact char(11) not null,
    Street varchar(30) not null,
    StreetNumber int(5) not null,
    Complement varchar(10),
    District varchar(30) not null,
    City varchar(30) not null,
    State char(2) not null,
    PostalCode char(8) not null,
    constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF)
);

alter table seller auto_increment=1;

-- criar tabela produto_vendedor - terceiro
create table productSeller (
idPseller int,
idPproduct int,
ProdQuantity int not null default 1,
primary key (idPseller, idPproduct),
constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

-- criar tabela relacão de produto pedido
create table productRequests (
idPRrequest int,
idPRproduct int,
PRQuantity int not null default 1,
PRStatus enum ('Disponível','Sem estoque') default 'Disponível',
primary key (idPRrequest, idPRproduct),
constraint fk_productrequest_seller foreign key (idPRrequest) references request(idRequest),
constraint fk_productrequest_product foreign key (idPRproduct) references product(idProduct)
);

-- criar tabela produto em estoque
create table storageLocation (
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar tabela produto fornecedor
create table productSupllier (
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplies foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);


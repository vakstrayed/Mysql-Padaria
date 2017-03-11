create database padaria
default character set utf8
default collate utf8_general_ci;

use padaria;
create table cliente(
cpf_cl varchar(14) not null,
nome_cl varchar(60) not null,
email_cl varchar(60) not null,
telefone_cl int not null,
primary key(cpf_cl)
)default charset = utf8;

create table fornecedor(
nome_forn varchar(60) not null,
cnpj_forn varchar(18) not null,
endereco_forn varchar(200) not null,
primary key(cnpj_forn)
)default charset = utf8;

create table produto(
cod_prod  SMALLINT not null AUTO_INCREMENT,
tipo_prod varchar(30) not null,
nome_prod varchar(60) not null,
valor_prod float not null,
primary key(cod_prod)
)default charset = utf8;

create table funcionario(
cpf_fc varchar(14) not null,
cpf_g varchar(14),
nome_fc varchar(60) not null,
carteiratrab_fc varchar(15) not null,
cargo_fc ENUM ('G','P','C') not null,
salario_fc float not null,
primary key(cpf_fc),
FOREIGN KEY(cpf_g) REFERENCES funcionario(cpf_fc)
)default charset = utf8;

create table compra_venda(
cod_cv SMALLINT not null,
data_cv datetime not null,
quantidade_cv varchar(30) not null,
cpf_cl varchar(14) not null,
cpf_fc varchar(14) not null,
cod_prod SMALLINT not null,
primary key(cpf_cl,cpf_fc,cod_prod),
FOREIGN KEY (cpf_cl) REFERENCES cliente(cpf_cl),
FOREIGN KEY (cpf_fc) REFERENCES funcionario(cpf_fc),
FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)

)default charset = utf8;

alter table compra_venda add index(cod_cv);

alter table compra_venda change cod_cv cod_cv smallint NOT NULL AUTO_INCREMENT;

create table produziu(
mes_prd date not null,
quantidade_prd SMALLINT not null,

cpf_fc varchar(14) not null,
cod_prod SMALLINT not null,
primary key(cpf_fc,cod_prod),
FOREIGN KEY (cpf_fc) REFERENCES funcionario(cpf_fc),
FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)

)default charset = utf8;

create table fornece(
cnpj_forn varchar(18) not null,
cod_prod SMALLINT not null,

primary key(cnpj_forn,cod_prod),
foreign key(cnpj_forn) references fornecedor (cnpj_forn),
foreign key(cod_prod) references produto (cod_prod)
)default charset = utf8;

create table supervisiona(
cpf_g varchar(14) not null,
cpf_e varchar(14) not null,

primary key(cpf_g,cpf_e),
FOREIGN KEY (cpf_g) REFERENCES funcionario(cpf_fc),
FOREIGN KEY (cpf_e) REFERENCES funcionario(cpf_fc)
)default charset = utf8;


#----------------------------------------------   POVOAMENTO DE CLIENTE   ----------------------------------------------------------#


insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('123.321.904-03','Severino Bil','bilzinho@yahoo.com.br',998783443);

insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('444.236.900-13','Maria josefina','josezinha@gmail.com',987675543);

insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('321.123.098-30','Katirina tereza','katinhalinda@yahoo.com.br',36334554);

insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('763.323.777-12','Olimpiano Paraiba Silva','olimpinPB@yahoo.com.br',976563121);

insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('099.333.470-09','Blenda Ultima','blendinhaultima@gmail.com',36218029);

insert into cliente (cpf_cl,nome_cl,email_cl,telefone_cl)
values ('081.709.809-31','Marcos Eduardo','eusouflautista@gmail.com',36345780);

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE FORNECEDOR   ----------------------------------------------------------#

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Coca Cola','19.976.337/0001-67','av marinho rufino');

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Boitata Farinhas','64.604.340/0001-04','rua jardim jardinagem');

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Higeniza life','19.739.889/0001-51','rua claro clarividente');

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Tody','56.068.838/0001-71','av ultima travessa padrinho');

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Frios feitos','64.341.278/0001-05','travessa travesseiro');

insert into fornecedor (nome_forn,cnpj_forn,endereco_forn)
values ('Rosquinhas rosquentas','61.577.778/0001-52','rua sadia sadio');

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE PRODUTO   ----------------------------------------------------------#

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Pao','Pao de queijo',1.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Pao','Pao doce',0.5);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Bolo','Bolo de rolo',20.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Bolo','Bolo de chocolate',20.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Salgado','Coxinha',2.5);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Doce','Tortinha',1.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Bebida','Coca Cola',3.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Farinha','Farinha de Trrigo',26.7);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Papel','Papel Higineico',6.5);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Bebida','Todynho',3.0);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Frios','Presunto',2.5);

insert into produto (tipo_prod,nome_prod,valor_prod)
values ('Doce','Rosquinha',5.0);

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE FUNCIONÁRIO   ----------------------------------------------------------#

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('130.912.876-61',Null,'Francisco Junior','120.4647.465-3','G',1000.0);

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('280.561.676-68','130.912.876-61','Igor Manoel Ciqueira','120.9715.726-4','P',900.0);

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('655.278.827-41','130.912.876-61','Jeane Rego da Silva','120.5226.058-9','P',900.0);

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('798.838.426-00','130.912.876-61','Marcos Barbosa de Sá','120.4732.862-6','P',900.0);

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('201.585.183-65','130.912.876-61','Caio Bezerra','120.8979.144-8','C',600.0);

insert into funcionario (cpf_fc,cpf_g,nome_fc,carteiratrab_fc,cargo_fc,salario_fc)
values ('106.551.050-00','130.912.876-61','Thiago Alvez','120.8297.789-9','C',600.0);

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE RELAÇÃO COMPRA/VENDA   ----------------------------------------------------------#

insert into compra_venda(cpf_cl,cpf_fc,cod_prod,quantidade_cv,data_cv)
values ('123.321.904-03','201.585.183-65',2,3, str_to_date('02-03-2017 09:33:09','%d-%m-%Y %H:%i:%s'));

insert into compra_venda(cpf_cl,cpf_fc,cod_prod,quantidade_cv,data_cv)
values ('444.236.900-13','201.585.183-65',4,2, str_to_date('03-03-2017 10:20:01','%d-%m-%Y %H:%i:%s'));

insert into compra_venda(cpf_cl,cpf_fc,cod_prod,quantidade_cv,data_cv)
values ('321.123.098-30','106.551.050-00',7,1,str_to_date('04-03-2017 08:10:12','%d-%m-%Y %H:%i:%s'));

insert into compra_venda(cpf_cl,cpf_fc,cod_prod,quantidade_cv,data_cv)
values ('763.323.777-12','106.551.050-00',5,2,str_to_date('04-03-2017 11:43:23','%d-%m-%Y %H:%i:%s'));

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE RELAÇÃO FORNECE   ----------------------------------------------------------#

insert into fornece(cnpj_forn,cod_prod) values ('19.976.337/0001-67',7);

insert into fornece(cnpj_forn,cod_prod) values ('64.604.340/0001-04',8);

insert into fornece(cnpj_forn,cod_prod) values ('19.739.889/0001-51',9);

insert into fornece(cnpj_forn,cod_prod) values ('56.068.838/0001-71',10);

insert into fornece(cnpj_forn,cod_prod) values ('64.341.278/0001-05',11);

insert into fornece(cnpj_forn,cod_prod) values ('61.577.778/0001-52',12);

#------------------------------------------------------------------------------------------------------------------------------------#

#----------------------------------------------   POVOAMENTO DE RELAÇÃO PRODUZIU  ----------------------------------------------------------#

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('106.551.050-00',1,12,str_to_date('01-03-2017','%d-%m-%Y'));

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('130.912.876-61',2,6,str_to_date('02-03-2017','%d-%m-%Y'));

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('201.585.183-65',3,7,str_to_date('01-03-2017','%d-%m-%Y'));

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('280.561.676-68',4,9,str_to_date('02-03-2017','%d-%m-%Y'));

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('655.278.827-41',5,5,str_to_date('01-03-2017','%d-%m-%Y'));

insert into produziu(cpf_fc,cod_prod,quantidade_prd,mes_prd) 
values('798.838.426-00',6,11,str_to_date('02-03-2017','%d-%m-%Y'));

#------------------------------------------------------------------------------------------------------------------------------------#

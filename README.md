# Objetivo do documento

	O presente documento possui por objetivo realizar a descrição do sistema de banco de dados de uma padaria. Para tanto, apresenta a identificação de entidades e relacionamentos, descrição de aspectos do mundo real e do sistema, formas das consultas e relatórios, além dos modelos ER e relacional E.

Descrição de aspectos do mundo real e do sistema

Os clientes do banco podem ser pessoas interessadas em efetuar uma compra na padaria. Para se cadastrar no banco os clientes devem apresentar cpf, nome, e-mail e telefone. O banco atribui um código próprio para identificar qualquer um dos seus clientes, sendo este o seu cpf.
Cada cliente está associado a uma ou mais compra/venda. Cada compra/venda possui um código que a identifica, sua data de ocorrência e uma quantidade. Além de existir um fornecedor que possui um CNPJ, nome e endereço. Têm-se também a relação de fornecimento, que associa fornecedores a produtos. Além de uma relação que especifica a quantidade de produtos que um funcionário produziu em um determinado mês. Existe a relação em que um funcionário possua ou não um supervisor.
O funcionário possui no banco além de cpf e nome, o número da carteira de trabalho, o seu cargo (Gerente, Padeiro ou Caixa) e o valor do seu salário, estando então associado a compra/venda de um ou mais determinados produtos e a produção de nenhum ou vários produtos. O produto possui um código de referência, o seu tipo, nome e valor. 

# Identificação das entidades

●	Cliente:  Entidade representa um cliente associado a padaria. Possui como atributos: 

1.	cpf_cl (chave primária)
2.	nome_cl
3.	email_cl 
4.	telefone_cl 



●	Funcionário:  Entidade representa um funcionário associado a padaria. Possui como atributos: 

1.	cpf_fc (chave primária)
2.	nome_fc
3.	carteiratrab_fc 
4.	cargo_fc (G – gerente/P – padeiro/C – caixa)
5.	salario_fc 
6.	cpf_g (chave estrangeira)

●	Produto:  Entidade representa um produto associado a padaria. Possui como atributos: 

1.	cod_prod (chave primária)
2.	tipo_prod
3.	nome_prod 
4.	valor_prod 

●	Fornecedor:  Entidade representa um fornecedor associado a padaria. Possui como atributos: 

1.	nome_forn 
2.	cnpj_forn (chave primária)
3.	endereco_forn


# Identificação dos relacionamentos

●	Produziu: Relacionamento entre Funcionário e Produto. Cardinalidade: um para muitos (1:N) e , zero pra muitos (0:N).  Possui como atributos:

1.	quantidade_prd
2.	mes_prd
3.	cpf_fc (chave estrangeira/chave primária)
4.	cod_prod (chave estrangeira/chave primária)


●	Compra_venda: Relacionamento entre Funcionário, Produto e o Cliente. Cardinalidade: um para muitos (1:N) e muitos para muitos (M,N).  Possui como atributos:

1.	data_cv
2.	quantidade_cv
3.	cod_cv
4.	cpf_cl (chave estrangeira/chave primaria)
5.	cpf_fc(chave estrangeira/chave primaria)
6.	cod_prod (chave estrangeira/chave primaria)

●	Supervisiona: Relacionamento entre Funcionário e ele próprio. Cardinalidade: zero para um (0:1) e um para muitos (1:N). Esta relação está presente na tabela de funcionário.  Possui como atributos:

1.	cpf_g (chave estrangeira)
2.	cpf_fc (chave estrangeira/chave primaria)

●	Fornece: Relacionamento entre Fornecedor e Produto. Cardinalidade: um para muitos (1:N).  Possui como atributos:

1.	cod_forn (chave estrangeira/chave primaria)
2.	cod_prod (chave estrangeira/chave primaria)



# Consultas e relatórios

●	Consultar dados de um cliente;

●	Consultar dados de um funcionário;

●	Consultar dados de um produto;

●	Consultar o funcionário que supervisiona um outro funcionário;

●	Consultar dados sobre uma venda;

●	Consultar dados de um fornecedor;

●	Relatório de fornecimento de produtos;

●	Relatório de compras e vendas;

●	Relatório de produção;

●	Relatório de clientes;

●	Relatório de funcionários;

●	Relatório de produtos;

●	Relatório de fornecedores;

●	Relatório de funcionários supervisionados.



# Modelo Relacional

Cliente{cpf_cl,nome_cl,email_cl,telefone_cl};
Produto{cod_prod,tipo_prod,nome_prod,valor_prod};
Funcionario{cpf_fc,nome_fc,carteiratrab_fc,cargo_fc,salario_fc,cpf_g};
Fornecedor{cnpj_forn,nome_forn,endereco_forn};
Fornece{cod_forn,cod_prod};
Produziu{cpf_fc, cod_prod, quantidade_prd, mes_prd};
Compra_venda{cpf_fc,cpf_cl,cod_prod,data_cv,quantidade_cv,cod_cv};

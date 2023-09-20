CREATE TABLE [dbo].[tbl_cliente]
(
	 cod_cliente VARCHAR(25) NOT NULL PRIMARY KEY
	,desc_cliente VARCHAR(200) NULL
	,endereco VARCHAR(200) NULL
	,faturamento FLOAT
	,desc_segmento VARCHAR(200)
	,desc_cidade VARCHAR(200)
	,cod_estado VARCHAR(25)
	,desc_estado VARCHAR(200)
	,desc_regiao VARCHAR(200)
	,arquivo_origem VARCHAR(200)
	,data_carga DATETIME
)

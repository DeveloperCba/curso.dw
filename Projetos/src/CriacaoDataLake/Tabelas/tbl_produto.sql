CREATE TABLE [dbo].[tbl_produto]
(
	 cod_produto VARCHAR(25) NOT NULL PRIMARY KEY
	,desc_produto VARCHAR(200) NULL
	,desc_departamento VARCHAR(200) NULL
	,atr_unidade_medida VARCHAR(50) NULL
	,cod_fornecedor VARCHAR(25) null
	,desc_fornecedor VARCHAR(200)
	,arquivo_origem VARCHAR(200)
	,data_carga DATETIME
)

/* 

CREATE DATABASE DW_ATACADEZ
GO

*/

USE DW_ATACADEZ
GO

CREATE TABLE DBO.dim_tempo (
                id_tempo INT NOT NULL,
                cod_tempo VARCHAR(8) NOT NULL,
                data DATETIME NOT NULL,
                cod_mes_ano VARCHAR(6) NOT NULL,
                desc_mes_ano VARCHAR(100) NOT NULL,
                cod_ano VARCHAR(4) NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (id_tempo)
)

CREATE TABLE DBO.dim_materia_prima_saida (
                cod_unidade_montagem VARCHAR(10) NOT NULL,
                desc_unidade_montagem VARCHAR(100) NOT NULL,
                cod_departamento VARCHAR(10) NOT NULL,
                desc_departamento VARCHAR(100) NOT NULL,
                CONSTRAINT dim_materia_prima_saida_pk PRIMARY KEY (cod_unidade_montagem)
)

CREATE TABLE DBO.dim_materia_prima_entrada (
                cod_tipo_materia_prima_entrada VARCHAR(10) NOT NULL,
                desc_tipo_materia_prima_entrada VARCHAR(100) NOT NULL,
                CONSTRAINT dim_materia_prima_entrada_pk PRIMARY KEY (cod_tipo_materia_prima_entrada)
)

CREATE TABLE DBO.dim_materia_prima (
                id_materia_prima INT NOT NULL,
                cod_materia_prima VARCHAR(10) NOT NULL,
                desc_materia_prima VARCHAR(100) NOT NULL,
                tipo_materia_prima_saida VARCHAR(50) NOT NULL,
                cod_tipo_materia_prima_entrada VARCHAR(10) NOT NULL,
                cod_unidade_montagem VARCHAR(10) NOT NULL,
                CONSTRAINT dim_materia_prima_pk PRIMARY KEY (id_materia_prima)
)

CREATE TABLE DBO.dim_produto (
                id_produto INT NOT NULL,
                cod_produto VARCHAR(10) NOT NULL,
                desc_produto VARCHAR(100) NOT NULL,
                cod_segmento VARCHAR(10) NOT NULL,
                desc_segmento VARCHAR(100) NOT NULL,
                CONSTRAINT dim_produto_pk PRIMARY KEY (id_produto)
)

CREATE TABLE DBO.fato_producao (
                id_produto INT NOT NULL,
                id_tempo INT NOT NULL,
                id_materia_prima_entrada INT NOT NULL,
                id_materia_prima_saida INT NOT NULL,
                quantidade FLOAT NOT NULL,
                custo_unitario FLOAT NOT NULL,
                custo_total FLOAT NOT NULL,
                CONSTRAINT fato_producao_pk PRIMARY KEY (id_produto, id_tempo, id_materia_prima_entrada, id_materia_prima_saida)
)

ALTER TABLE DBO.fato_producao ADD CONSTRAINT dim_tempo_fato_producao_fk
FOREIGN KEY (id_tempo)
REFERENCES DBO.dim_tempo (id_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE DBO.dim_materia_prima ADD CONSTRAINT dim_materia_prima_saida_dim_materia_prima_fk
FOREIGN KEY (cod_unidade_montagem)
REFERENCES DBO.dim_materia_prima_saida (cod_unidade_montagem)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE DBO.dim_materia_prima ADD CONSTRAINT dim_materia_prima_entrada_dim_materia_prima_fk
FOREIGN KEY (cod_tipo_materia_prima_entrada)
REFERENCES DBO.dim_materia_prima_entrada (cod_tipo_materia_prima_entrada)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE DBO.fato_producao ADD CONSTRAINT dim_materia_prima_fato_producao_fk
FOREIGN KEY (id_materia_prima_entrada)
REFERENCES DBO.dim_materia_prima (id_materia_prima)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE DBO.fato_producao ADD CONSTRAINT dim_materia_prima_fato_producao_fk1
FOREIGN KEY (id_materia_prima_saida)
REFERENCES DBO.dim_materia_prima (id_materia_prima)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE DBO.fato_producao ADD CONSTRAINT dim_produto_fato_producao_fk
FOREIGN KEY (id_produto)
REFERENCES DBO.dim_produto (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
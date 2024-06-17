------------------------
		---CONEXAO COM O DW-----
		------------------------

		USE dw_commerce
		GO

		------------------------
		--CRIAÇAO DA PROCEDURE--
		------------------------

		CREATE PROC load_fact
		AS

		DECLARE @FINAL DATETIME 
		DECLARE	@INICIAL DATETIME
		
		SELECT  @FINAL = MAX(date)
		FROM dw_commerce.dbo.dim_time T

		SELECT @INICIAL = MAX(date)
			FROM dw_commerce.dbo.fact F
			JOIN dw_commerce.dbo.dim_time T ON (F.id_time=T.id_sk)

		IF @INICIAL IS NULL
		BEGIN
			SELECT @INICIAL = MIN(date)
			FROM dw_commerce.dbo.dim_time T
		END

		INSERT INTO dw_commerce.dbo.fact(
			[id_invoice],
			[id_client],
			[id_seller],
			[id_method],
			[id_supplier],
			[id_product],
			[id_time],
			[quantity],
			[total_item],
			[total_cost],
			[total_profit])
		SELECT
			I.id_sk AS IDNOTA,
			C.id_sk AS IDCLIENTE,
			S.id_sk AS IDVENDEDOR,
			M.id_sk AS IDFORMA,
			SP.id_sk AS IDFORNECEDOR,
			P.id_sk AS IDPRODUTO,	
			T.id_sk AS IDTEMPO,
			F.quantity AS QUANTIDADE,
			F.total_item AS TOTAL_ITEM,
			F.total_cost AS CUSTO_TOTAL,
			F.total_profit AS LUCRO_TOTAL
	
		FROM
			stage_commerce.dbo.st_fact F

			INNER JOIN dbo.dim_method M
			on (F.id_method=M.id_method)	 

			INNER JOIN DBO.dim_invoice I
			on (F.id_invoice=I.id_invoice)

				INNER JOIN dbo.dim_supplier SP
			on (F.id_supplier=SP.id_supplier
				AND (SP.start <= F.date AND (SP.[end] >= F.date) or (SP.[end] IS NULL)))

			INNER JOIN dbo.dim_client C
			on (F.id_client=C.id_client
				AND (C.[end] <= F.date
				AND (C.[end] >= F.date) or (C.[end] IS NULL)))

				INNER JOIN dbo.dim_seller S
			on (F.id_seller=S.id_seller
				AND (S.start <= F.date
				AND (S.[end] >= F.date) or (S.[end] IS NULL)))

				INNER JOIN dbo.dim_product P
			ON (F.id_product=P.id_product 
			AND (P.start <= F.date 
			AND (P.[end] >= F.date) OR (P.[end] IS NULL)))

			INNER JOIN dbo.dim_time T
			ON (CONVERT(VARCHAR, T.date,102) = CONVERT(VARCHAR,
			F.date,102))
			--WHERE F.DATA > @INICIAL AND F.DATA < @FINAL
			WHERE F.date BETWEEN @INICIAL AND @FINAL
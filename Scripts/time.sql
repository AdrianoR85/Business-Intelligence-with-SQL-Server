-------------------------------
--CARREGANDO A DIMENSÃO TEMPO--
-------------------------------
PRINT CONVERT(VARCHAR, GETDATE(),113)

DECLARE @DATAINICIO DATETIME, 
		@DATAFIM DATETIME, 
		@DATA DATETIME

PRINT GETDATE()
	SELECT @DATAINICIO = '1/1/1950', 
			@DATAFIM = '1/1/2050'

	SELECT @DATA = @DATAINICIO 

WHILE @DATA < @DATAFIM 
BEGIN 
	INSERT INTO dim_time (
		[date],
		[day],
		[weekday],
		[month],
		[month_names],
		[quarter],
		[quarter_name],
		[year]
		
	)
	SELECT 
		-- [date]
		@DATA AS DATA,  
		-- [day]
		DATEPART(DAY,@DATA) AS DIA,
		-- [weekday]
		CASE DATEPART(DW, @DATA) 
			WHEN 1 THEN 'Sunday'
			WHEN 2 THEN 'Monday'
			WHEN 3 THEN 'Tuesday'
			WHEN 4 THEN 'Wednesday'
			WHEN 5 THEN 'Thursday'
			WHEN 6 THEN 'Friday'
			WHEN 7 THEN 'Saturday'
		END AS DIASEMANA,
		-- [month]
		DATEPART(MONTH,@DATA) AS MES, 
		--[month_names]
		DATEPART(MONTH,@DATA) AS NOMEMES, 
		--[quarter]
		DATEPART(qq, @DATA) AS QUARTO,
		--[quarter_year]
		CASE DATEPART(qq, @DATA)
			WHEN 1 THEN 'First'
			WHEN 2 THEN 'Second'
			WHEN 3 THEN 'Third'
			WHEN 4 THEN 'Fourth'
		END AS NOMEQUARTO,
		--[year]
		DATEPART(YEAR, @DATA) AS ANO
	SELECT @DATA = DATEADD(dd,1, @DATA)
END

UPDATE dim_time
SET [day] = '0' + [day]
WHERE LEN([day]) = 1

UPDATE dim_time
SET [month] = '0' + [month]
WHERE LEN([month]) = 1

UPDATE dim_time
SET [full_date] = [year] + [month] + [day]
GO

SELECT * FROM dim_time

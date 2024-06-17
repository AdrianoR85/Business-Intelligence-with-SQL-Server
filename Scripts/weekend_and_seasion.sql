----------------------------------------------------
--------------WEEKENDS AND SEASONS------------------
----------------------------------------------------
DECLARE c_time CURSOR FOR 
	SELECT [id_sk], [full_date], [weekday], [year] FROM dim_time
DECLARE	
	@ID INT, 
	@DATE VARCHAR(10),
	@WEEKDAYS VARCHAR(20),
	@YEAR CHAR(4),
	@WEEKEND CHAR(3),
	@SEASONS VARCHAR(15)
OPEN c_time
	FETCH NEXT FROM c_time
	INTO @ID, @DATE, @WEEKDAYS, @YEAR
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @WEEKDAYS IN ('Sunday', 'Saturday') 
			SET @WEEKEND = 'Yes'
		ELSE
			SET @WEEKEND = 'No'

		IF @DATE BETWEEN CONVERT(CHAR(4), @YEAR)+'0923'
		AND CONVERT(CHAR(4), @YEAR)+'1220'
			SET @SEASONS = 'Spring'
		ELSE IF @DATE BETWEEN CONVERT(CHAR(4), @YEAR)+'0321'
		AND CONVERT(CHAR(4), @YEAR)+'0620'
			SET @SEASONS = 'Fall'
		ELSE IF @DATE BETWEEN CONVERT(CHAR(4), @YEAR)+'0621'
		AND CONVERT(CHAR(4), @YEAR)+'0922'
			SET @SEASONS = 'Winter'
		ELSE 
			SET @SEASONS = 'Summer'

		UPDATE dim_time SET weekend = @WEEKEND
		WHERE [id_sk] = @ID

		UPDATE dim_time SET [season] = @SEASONS
		WHERE [id_sk] = @ID
	
	FETCH NEXT FROM c_time
	INTO @ID, @DATE, @WEEKDAYS, @YEAR
END
CLOSE c_time
DEALLOCATE c_time
GO

select * from dim_time


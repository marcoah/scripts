USE gestion
GO
 
DECLARE @Counter INT , @MinId INT, @MaxId INT, 
        @CountryName NVARCHAR(100)

SET @Counter =1
SELECT @MinID = min(documento_id) , @MaxId = max(documento_id) FROM documentos WHERE documento_tipo='FC'

PRINT CONVERT(VARCHAR,@Counter)
PRINT CONVERT(VARCHAR,@MinId)
PRINT CONVERT(VARCHAR,@MaxId)
 
WHILE(@MinId IS NOT NULL AND @MinId <= @MaxId)
BEGIN
   if exists(SELECT * FROM documentos WHERE documento_id = @MinId AND documento_tipo='FC')
   begin
		SELECT @CountryName = documento_numero FROM documentos WHERE documento_id = @MinId AND documento_tipo='FC'
		PRINT CONVERT(VARCHAR,@Counter) + '. el id del documento es ' + CONVERT(VARCHAR,@MinId)  + '. el numero del documento es ' + @CountryName

		UPDATE documentos SET documento_numero = @Counter WHERE documento_id = @MinId AND documento_tipo='FC';
		UPDATE detalle SET documento_numero = @Counter WHERE documento_id = @MinId AND documento_tipo='FC';

		SET @Counter  = @Counter  + 1	   
	end
   else
	begin
		print ''
	end

	SET @MinId  = @MinId  + 1
END
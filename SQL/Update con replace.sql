UPDATE [dbo].[empresas]
SET empresa_rif = REPLACE(empresa_rif, '-', '')  
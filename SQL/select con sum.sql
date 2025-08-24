SELECT SUM(`documento_total`) AS Total, 
SUM(IF(documento_moneda = "USD", documento_total,0)) AS TotalUSD, 
SUM(IF(documento_moneda <> "USD", documento_total,0)) AS TotalBs,
SUM(IF(documento_moneda <> "USD", documento_total/documento_tasa,0)) AS TotalUS_2, 
COUNT(*) AS Entries
 FROM documentos;
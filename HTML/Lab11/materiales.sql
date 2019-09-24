BULK INSERT a1154945.a1154945.[materiales]
FROM 'e:\wwwroot\rcortese\materiales.csv'
WITH (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
    )
SELECT  * FROM Materiales

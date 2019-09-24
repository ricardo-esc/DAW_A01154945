BULK INSERT a1154945.a1154945.[proveedores]
FROM 'e:\wwwroot\rcortese\proveedores.csv'
WITH (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
    )
SELECT  * FROM Proveedores
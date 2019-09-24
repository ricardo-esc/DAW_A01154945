   SET DATEFORMAT dmy
BULK INSERT a1154945.a1154945.[Entregan]
FROM 'e:\wwwroot\rcortese\entregan.csv'
WITH (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
    )

SELECT  * FROM Materiales

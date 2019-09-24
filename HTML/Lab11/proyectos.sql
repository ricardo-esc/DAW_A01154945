BULK INSERT a1154945.a1154945.[proyectos]
FROM 'e:\wwwroot\rcortese\proyectos.csv'
WITH (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
    )
SELECT  * FROM Proyectos
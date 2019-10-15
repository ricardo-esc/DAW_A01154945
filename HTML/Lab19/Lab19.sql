--1.
SELECT Descripcion, SUM(Cantidad) as 'Cantidades',  SUM(Entregan.Cantidad*(Materiales.Costo*(PorcentajeImpuesto/100)+1)) as 'CostoTotal'
FROM Materiales, Entregan, Proyectos
WHERE Materiales.Clave = Entregan.Clave AND Entregan.Fecha BETWEEN '01/01/97' AND '31/12/97'
GROUP BY Materiales.Descripcion

--2
SELECT RazonSocial, SUM(Cantidad) AS 'NumEntregas', SUM(Entregan.Cantidad*(Materiales.Costo*(PorcentajeImpuesto/100)+1)) as 'Importe Total'
FROM Proveedores, Entregan, Materiales
WHERE Entregan.RFC = Proveedores.RFC AND Materiales.Clave = Entregan.Clave
GROUP BY RazonSocial


--3
SELECT M.Clave, M.Descripcion, SUM(Cantidad) AS 'TotalEntregado', MIN(Entregan.Cantidad) as 'MinimaCantidad', MAX(Entregan.Cantidad) AS 'MaximaCantidad', SUM(Entregan.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as 'ImporteTotal'
FROM Materiales as M, Entregan 
WHERE M.Clave = Entregan.Clave 
GROUP BY M.Clave, M.Descripcion
HAVING AVG(Entregan.Cantidad) > 400


--4
SELECT P.RazonSocial,M.Clave, M.Descripcion, AVG(E.Cantidad) as 'PromedioMaterial'
FROM Proveedores as P, Materiales as M, Entregan as E
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial,M.Clave, M.DescripcionHAVING AVG(E.Cantidad) > 500


--5
SELECT P.RazonSocial,M.Clave, M.Descripcion, AVG(E.Cantidad) as 'PromedioMaterial'
FROM Proveedores as P, Materiales as M, Entregan as E
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial,M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) < 370 OR AVG(E.Cantidad) > 450


--6
INSERT INTO Materiales VALUES(1440,'Marmol Blanco',345,2.32)
INSERT INTO Materiales VALUES(1450,'Marmol Negro',234,2.45)
INSERT INTO Materiales VALUES(1460,'Granito Negro',300,2.19)
INSERT INTO Materiales VALUES(1470,'Granito Blanco',189,2.68)
INSERT INTO Materiales VALUES(1480,'Roble Rojo',150,2.79)


--7
SELECT Materiales.Clave, Materiales.Descripcion
FROM Materiales
WHERE Materiales.Clave
NOT IN
(SELECT Entregan.Clave
FROM Materiales, Entregan
WHERE Materiales.Clave = Entregan.Clave)


--8
SELECT RazonSocial
FROM Proveedores, Entregan, Proyectos
WHERE Proveedores.RFC = Entregan.RFC AND Entregan.Numero = Proyectos.Numero AND Proyectos.Denominacion = 'Vamos Mexico' AND Proyectos.Denominacion = 'Queretaro Limpio'


--9
SELECT Descripcion
FROM Materiales
WHERE Clave

NOT IN

(SELECT Entregan.Clave
FROM Materiales, Entregan, Proyectos
WHERE Materiales.Clave = Entregan.Clave AND Proyectos.Numero = Entregan.Numero AND Proyectos.Denominacion = 'Cit Yucatan')


--10
SELECT RazonSocial, AVG(Entregan.Cantidad) as 'PromedioEntregan'
FROM Proveedores, Entregan 
WHERE Proveedores.RFC = Entregan.RFC
GROUP BY RazonSocial
HAVING AVG(Entregan.Cantidad) >

(SELECT AVG(Entregan.Cantidad)
FROM Proveedores, Entregan
WHERE Proveedores.RFC = Entregan.RFC AND Proveedores.RFC ='VAGO780901')


--11
set dateformat dmy
SELECT Proveedores.RFC, RazonSocial
FROM Proveedores, Proyectos, Entregan
WHERE Proveedores.RFC = Entregan.RFC AND Proyectos.Numero = Entregan.Numero AND Proyectos.Denominacion = 'Infonavit Durango' AND Entregan.Fecha BETWEEN '01/01/00' AND '31/12/00'
GROUP BY Proveedores.RFC, RazonSocial
HAVING SUM(Entregan.Cantidad) >
(
SELECT SUM(Entregan.Cantidad) FROM Proveedores, Entregan,Proyectos
WHERE Proveedores.RFC = Entregan.RFC AND Entregan.Numero = Proyectos.Numero AND Proyectos.Denominacion = 'Infonavit Durango' AND (Entregan.Fecha BETWEEN '01/01/2001' AND '31/12/2001')
)






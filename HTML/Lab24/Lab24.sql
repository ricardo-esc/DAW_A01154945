--  Creacion de Tabla Cliemnte
CREATE TABLE Cliente
(
	NoCuenta varchar(5) PRIMARY KEY,
	Nombre varchar(30),
	Saldo numeric(10,2)
)

-- Creacion de Tabla Tipo Movimiento
CREATE TABLE TiposMovimiento (
	ClaveM VARCHAR (2) NOT NULL PRIMARY KEY,
	Descripcion varchar(30)
)

-- Crear Tabla Operaciones
CREATE TABLE Operaciones(
	noCuenta varchar(5),
	claveM varchar(2),
	fecha datetime,
	monto numeric(10,2),
	FOREIGN KEY(noCuenta) REFERENCES Cliente(NoCuenta),
	FOREIGN KEY(claveM) REFERENCES TiposMovimiento(ClaveM)
);

-- Insertar Registros de Tipo Movimiento
INSERT INTO TiposMovimiento (ClaveM,Descripcion) VALUES ('M1','Retiro');
INSERT INTO TiposMovimiento (ClaveM,Descripcion) VALUES ('M2','Deposito');

-- Insertar Registros de Cliente
INSERT INTO Cliente VALUES ('C1', 'Carlos Ayala',500.50);
INSERT INTO Cliente VALUES ('C2', 'Juan Perez',9.20);
INSERT INTO Cliente VALUES ('C3', 'John Smith',30.0);
INSERT INTO Cliente VALUES ('C4', 'Benji Valdes',1200.99);
INSERT INTO Cliente VALUES ('C5', 'Carlos Sanchez',0.0);

-- Prueba 1
BEGIN TRANSACTION PRUEBA1 
INSERT INTO Cliente VALUES('C6', 'Manuel Rios Maldonado', 9000); 
INSERT INTO Cliente VALUES('C7', 'Pablo Perez Ortiz', 5000); 
INSERT INTO Cliente VALUES('C8', 'Luis Flores Alvarado', 8000); 
COMMIT TRANSACTION PRUEBA1 

SELECT * FROM Cliente

-- Prueba 2

BEGIN TRANSACTION PRUEBA2
INSERT INTO Cliente VALUES('C9','Ricardo Rios Maldonado',19000);
INSERT INTO Cliente VALUES('C10','Pablo Ortiz Arana',15000);
INSERT INTO Cliente VALUES('C11','Luis Manuel Alvarado',18000);

SELECT * FROM Cliente

SELECT * FROM Cliente where NoCuenta='C1'

ROLLBACK TRANSACTION PRUEBA2


-- Prueba 3
BEGIN TRANSACTION PRUEBA3
INSERT INTO TiposMovimiento VALUES('A','Retiro Cajero Automatico');
INSERT INTO TiposMovimiento VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

-- Prueba 4

BEGIN TRANSACTION PRUEBA4 
INSERT INTO Operaciones VALUES('001','A',GETDATE(),500); 
UPDATE Cliente SET Saldo = Saldo -500 
WHERE NoCuenta='C1' 
COMMIT TRANSACTION PRUEBA4 

-- Prueba 5
BEGIN TRANSACTION PRUEBA5
INSERT INTO Cliente VALUES('C12','Rosa Ruiz Maldonado',9000);
INSERT INTO Cliente VALUES('C12','Luis Camino Ortiz',5000);
INSERT INTO Cliente VALUES('C12','Oscar Perez Alvarado',8000);


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END


-- Transaccion Registrar Reitro Cajero
CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
	(@uNoCuenta varchar(5), @uMonto NUMERIC(10,2))
	AS
	BEGIN
	SET NOCOUNT ON

		BEGIN TRANSACTION RETIRO
		UPDATE Cliente SET saldo = saldo - @uMonto WHERE noCuenta = @uNoCuenta;
		INSERT INTO Operaciones (noCuenta, claveM, fecha, monto) VALUES (@uNoCuenta, 'M1', GETDATE(), @uMonto)
		
		
		IF @@ERROR = 0
		COMMIT TRANSACTION RETIRO
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION RETIRO
		END

END

EXEC REGISTRAR_RETIRO_CAJERO C1, 400;  
GO

 -- Transaccion REGISTRAR_DEPOSITO_VENTANILLA
             IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'REGISTRAR_DEPOSITO_VENTANILLA ' AND type = 'P')
                DROP PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
            GO

            CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
                @uNoCuenta varchar(5) ,
                @umonto numeric(10,2)
            AS
                BEGIN TRANSACTION deposito
                INSERT INTO Operaciones VALUES(@uNoCuenta,'B',GETDATE(),@umonto);
                UPDATE Cliente SET Saldo = Saldo + @umonto
                WHERE NoCuenta=@uNoCuenta
                COMMIT TRANSACTION deposito
            GO

            --Probar Transacción Deposito
            EXECUTE REGISTRAR_DEPOSITO_VENTANILLA C1,'200'
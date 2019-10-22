            --Crear Material
            IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO
        --Probar Crear Material
        EXECUTE creaMaterial 5000,'Martillos Acme',250,15

        --Modifica Material
         IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial
            GO

            CREATE PROCEDURE modificaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                UPDATE Materiales SET Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto WHERE Clave=@uclave
            GO

            --Elimina Material
             IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial
            GO

            CREATE PROCEDURE eliminaMaterial
                @uclave NUMERIC(5,0)
            AS
                DELETE FROM Materiales WHERE Clave=@uclave
            GO

            --Probar Modificar Material
            EXECUTE modificaMaterial 5000,'Martillos Ricardo',250,15

            --Probar Eliminar Material
             EXECUTE eliminaMaterial 5000

           --CreaProyecto
           IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyecto' AND type = 'P')
                DROP PROCEDURE creaProyecto
            GO

            CREATE PROCEDURE creaProyecto
                @unumero NUMERIC(5),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO

            --ModificarProyecto
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'modificarProyecto' AND type='P')
                DROP PROCEDURE modificarProyecto
            GO

            CREATE PROCEDURE modificarProyecto
                @unumero NUMERIC(5),
                @udenominacion VARCHAR(50)
            AS
                UPDATE Proyectos SET Denominacion =@udenominacion WHERE Numero=@unumero
            GO

            --EliminarProyecto
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'eliminarProyecto' AND type='P')
                DROP PROCEDURE eliminarProyecto
            GO

            CREATE PROCEDURE eliminarProyecto
                @unumero NUMERIC(5),
                @udenominacion VARCHAR(50)
            AS
                DELETE FROM Proyectos WHERE Numero=@unumero
            GO

            --Crear Proveedores
            IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedores' AND type = 'P')
                DROP PROCEDURE creaProveedores
            GO

            CREATE PROCEDURE creaProveedores
                @urfc CHAR(13),
                @urazonsocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
            GO

            --Modificar Proveedores
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'modificarProveedores' AND type ='P' )
                DROP PROCEDURE modificarProveedores
            GO

            CREATE PROCEDURE modificarProveedores
                @urfc CHAR(13),
                @urazonsocial VARCHAR(50)
            AS
                UPDATE Proveedores SET RazonSocial = @urazonsocial WHERE RFC= @urfc

            --Eliminar Proveedor
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'eliminarProveedores' AND type='P')
                DROP PROCEDURE eliminarProveedores
            GO

            CREATE PROCEDURE eliminarProveedores
                @urfc CHAR(13)
            AS
                DELETE FROM Proveedores WHERE RFC=@urfc
            GO

            --Crear Entrega
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'creaEntrega' AND type='P')
                DROP Procedure creaEntrega
            GO

            CREATE PROCEDURE creaEntrega
                @uclave NUMERIC(5,0),
                @urfc CHAR(13),
                @unumero NUMERIC(5),
                @ufecha DATETIME,
                @ucantidad NUMERIC(8,2)
            AS
                INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
            GO

            --ModificarEntrega
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'modificarEntrega' AND type='P')
                DROP Procedure modificarEntrega
            GO

            CREATE PROCEDURE modificarEntrega
                @uclave NUMERIC(5,0),
                @urfc CHAR(13),
                @unumero NUMERIC(5),
                @ufecha DATETIME,
                @ucantidad NUMERIC(8,2)
            AS
                UPDATE Entregan SET RFC = @urfc, Numero = @unumero,Fecha = @ufecha, Cantidad = @ucantidad WHERE Clave = @uclave
            GO

            --Eliminar Entrega
            IF EXISTS (SELECT name FROM sysobjects
                        WHERE name = 'eliminarEntrega' AND type='P')
                DROP PROCEDURE eliminarEntrega
            GO

            CREATE PROCEDURE eliminarEntrega
                @uclave CHAR(13)
            AS
                DELETE FROM Entregan WHERE Clave=@uclave
            GO

            --Funcion
            IF EXISTS (SELECT name FROM sysobjects
                WHERE name = 'queryMaterial' AND type = 'P')
            DROP PROCEDURE queryMaterial
            GO

            CREATE PROCEDURE queryMaterial
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2)
            AS
                SELECT * FROM Materiales WHERE descripcion
                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
            GO

           EXECUTE queryMaterial 'Lad',20






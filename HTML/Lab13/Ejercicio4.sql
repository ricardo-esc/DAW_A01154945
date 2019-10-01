	--Setencia Insert
	INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0)

	--Eliminar Registro
	Delete from Entregan where Cantidad = 0 

	--Añadir Restriccion de Cantidad
   ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ; 
   
   	--Insertar Registro Inconsciente
	INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0)
	
	--Chevar las insocnsitencias
	sp_helpconstraint entregan 
  
  
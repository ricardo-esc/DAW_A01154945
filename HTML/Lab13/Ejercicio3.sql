--Insertar Registro en Entregan
  INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0)
  
  --Eliminar Registro Inconsistente 
  Delete from Entregan where Clave = 0 
  
  --Agregar llave foranea a Entregan "clave"
  ALTER TABLE entregan add constraint cfentreganclave foreign key (clave) references materiales(clave)
  
  --Intentar meter registro inconsciente
  INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0)
  
   --Agregar llave foranea a Entregan "RFC"
  ALTER TABLE entregan add constraint cfentreganRFC foreign key (RFC) references proveedores(RFC)
  
   --Agregar llave foranea a Entregan "Numero"
  ALTER TABLE entregan add constraint cfentregannumero foreign key (numero) references proyectos(numero)
  
  --Visualizar los constraints
  	sp_helpconstraint entregan
  
  
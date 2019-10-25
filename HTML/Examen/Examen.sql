CREATE TABLE IF NOT EXISTS Zombie(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(40) NOT NULL
) 

CREATE TABLE IF NOT EXISTS Estado(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estado varchar(20) NOT NULL 
)

CREATE TABLE IF NOT EXISTS Registro(
	idZombie int NOT NULL ,
	idEstado int NOT NULL ,
	fechaHora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (idZombie) REFERENCES Zombie(id),
	FOREIGN KEY(idEstado) REFERENCES Estado(id)
)

INSERT INTO Estado (estado) VALUES ('infeccion')
INSERT INTO Estado (estado) VALUES ('desorientacion')
INSERT INTO Estado (estado) VALUES ('violencia')
INSERT INTO Estado (estado) VALUES ('desmayo')
INSERT INTO Estado (estado) VALUES ('transformacion')

DELIMITER //

CREATE PROCEDURE RegistrarZombie(nombre varchar(40) )
BEGIN
	INSERT INTO Zombie (nombre) VALUES (nombre);
END //

DELIMITER;

DELIMITER //

CREATE PROCEDURE obZombies()
BEGIN
	SELECT id, nombre FROM Zombie;
END //

DELIMITER;

DELIMITER //

CREATE PROCEDURE registrarEstado(zombie int, estado int )
BEGIN
	INSERT INTO Registro (idZombie,idEstado) VALUES(zombie,estado);
END //

DELIMITER;

SELECT COUNT(idZombie) AS 'Total'
From Registro

DELIMITER //

CREATE PROCEDURE TerceraConsulta()
BEGIN
	SELECT nombre, estado, FechaHora
 	FROM Zombie, Estado, Registro
WHERE idZombie = Zombie.id AND Registro.idEstado = Estado.id
ORDER BY FechaHora DESC;
END //

DELIMITER;



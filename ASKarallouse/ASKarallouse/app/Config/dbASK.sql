
CREATE DATABASE cakephp;
/*CREATE DATABASE ebsxjflv_igd;*/

CREATE USER 'cakephpuser'@'localhost' IDENTIFIED BY 'cakephppass';
/*CREATE USER 'ebsxj_igd'@'localhost' IDENTIFIED BY 'VilarTheBoss2015';*/

GRANT ALL PRIVILEGES ON cakephp.* TO cakephpuser@'localhost' IDENTIFIED BY "cakephppass";
/*GRANT ALL PRIVILEGES ON ebsxjflv_igd.* TO 'ebsxj_igd'@'localhost';*/

USE cakephp;
/*USE ebsxjflv_igd;*/



CREATE TABLE IF NOT EXISTS `users` (
	id INT UNSIGNED AUTO_INCREMENT,
	username VARCHAR(20) NOT NULL UNIQUE,
	name VARCHAR(30) NOT NULL,
	surname VARCHAR(50) NOT NULL,	
	password VARCHAR(255) NOT NULL,
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `posts` (
  	id INT UNSIGNED AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(255),
  	modDate TIMESTAMP NOT NULL,
	initDate TIMESTAMP,
	state TINYINT(1),
	category ENUM ('Electrónica', 'Informática', 'Telefonía', 'Deportes', 'Mascotas', 'Juegos', 'Motor', 'Otros'),
	user_id INT UNSIGNED,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `responses` (
	id INT UNSIGNED AUTO_INCREMENT,
	content VARCHAR(255) NOT NULL,
  	modDate TIMESTAMP NOT NULL,	
	initDate TIMESTAMP,
	utility TINYINT(1),
	user_id INTEGER UNSIGNED,	
	post_id INTEGER UNSIGNED,		
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `tags` (
  	id INT(10) NOT NULL AUTO_INCREMENT,
	electrónica ENUM ('Imagen', 'Sonido', 'Otros electrónica'),
	informática ENUM ('Ordenadores', 'Microsoft Windows', 'Linux', 'Mac OS', 'Hardware', 'Software', 'Drivers', 'Tablets', 'Otros informática'),
	telefonía ENUM ('IOS', 'Android', 'Windows Phone', 'Otros telefonía'),
	deportes ENUM ('Fútbol', 'Baloncesto', 'Tenis', 'Balonmano', 'Formula 1', 'Motociclismo', 'Otros deportes'),
	mascotas ENUM ('Perros', 'Gatos', 'Pájaros', 'Peces', 'Caballos', 'Veterinarios', 'Otros animales'),
	juegos ENUM ('Videoconsolas', 'Videojuegos', 'Juegos de mesa', 'Otros juegos'),
	motor ENUM ('Coches', 'Motos', 'Caravanas', 'Camiones', 'Vehículos agrícolas', 'Repuestos', 'Otros motor'),	
	otros VARCHAR(25),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `posts_tags` (
	id INT(10) NOT NULL AUTO_INCREMENT,
  	tag_id INTEGER NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `votes` (
	id INT(10) NOT NULL AUTO_INCREMENT,
	user_id INTEGER NOT NULL,
	response_id INTEGER NOT NULL,
	vote TINYINT(1),
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `favorites` (
	id INT(10) NOT NULL AUTO_INCREMENT,
	user_id INTEGER NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `visits` (
	id INT(10) NOT NULL AUTO_INCREMENT,
	user_id INTEGER NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `smsPrivados` (
	id INT(10) NOT NULL AUTO_INCREMENT,
	user_e INTEGER NOT NULL,
	user_r INTEGER NOT NULL,
	head VARCHAR(30),
	body VARCHAR(255),
	inbox TINYINT(1),
	outbox TINYINT(1),
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE posts
	ADD FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE posts_tags
	ADD FOREIGN KEY (tag_id) 
	REFERENCES tags (id),
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (id);

ALTER TABLE responses
	ADD FOREIGN KEY (user_id) 
	REFERENCES users (id),
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE votes
	ADD FOREIGN KEY (user_id) 
	REFERENCES users (id),
	ADD FOREIGN KEY (response_id) 
	REFERENCES responses (id);

ALTER TABLE favorites
	ADD FOREIGN KEY (user_id) 
	REFERENCES users (id)
	ON DELETE CASCADE
  	ON UPDATE CASCADE,
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (id)
	ON DELETE CASCADE
  	ON UPDATE CASCADE;

ALTER TABLE visits
	ADD FOREIGN KEY (user_id) 
	REFERENCES users (id),
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (id)
	ON DELETE CASCADE
  	ON UPDATE CASCADE;

ALTER TABLE smsPrivados
	ADD FOREIGN KEY (user_e) 
	REFERENCES users (id),
	ADD FOREIGN KEY (user_r) 
	REFERENCES users (id);








INSERT INTO `cakephp`.`users` (`id`, `username`, `name`, `surname`, `password`, `email`) VALUES (NULL, 'IGD1989', 'Isaac', 'González Domínguez', '123456', 'igdx1989@gmail.com'),
 (NULL, 'DiegoSelles', 'Diego', 'Rodríguez Selles', '123456', 'diegoselles10@gmail.com');


INSERT INTO `cakephp`.`posts` (`id`, `title`, `content`, `modDate`, `initDate`, `state`, `category`, `user_id`) VALUES (NULL, 'Título 1', 'Contenido 1', CURRENT_TIMESTAMP, '2015-12-02 23:44:00', '0', 'Informática', '1'),
 (NULL, 'Título 2', 'Contenido 2', CURRENT_TIMESTAMP, '2015-12-02 23:48:00', '0', 'Deportes', '2');
















INSERT INTO `usuarios` (`id`, `alias`, `nombre`, `apellidos`, `password`, `email`) VALUES (NULL, 'IGD1989', 'Isaac', 'González Domínguez', '123456', 'igdx1989@gmail.com'),
 (NULL, 'diegoSelles', 'Diego', 'Rodríguez Sellés', '123456', 'diegoselles@gmail.com'),
 (NULL, 'mltallon', 'Manuel', 'Lorenzo Tallón', '123456', 'mltallon@gmail.com');


INSERT INTO `posts` (`idPost`, `titulo`, `contenido`, `fechaModificacion`, `fechaCreacion`, `usuario_id`) VALUES ('1', 'Configuración UniServerZ', '¿Cómo se cambian los puertos en UniServerZ?', CURRENT_TIMESTAMP, '2015-11-26 22:53:13', '3');


INSERT INTO `respuestas` (`idRespuesta`, `contenido`, `fechaModificacion`, `fechaCreacion`, `usuario_id`, `post_id`) VALUES (NULL, 'En el fichero de configuración de apache2.', CURRENT_TIMESTAMP, '2015-11-26 23:23:03', '2', '1');


INSERT INTO `visitas` (`usuario_id`, `post_id`) VALUES ('1', '1'), ('2', '1');

INSERT INTO `votos` (`usuario_id`, `respuesta_id`) VALUES ('1', '1');

INSERT INTO `smsPrivados` (`usuario_emisor`, `usuario_receptor`, `cabecera`, `cuerpo`, `recibido`, `enviado`) VALUES ('1', '2', 'Entrega TSW', '¿Cómo llevais la entrega2 de TSW?', NULL, '1'),
 ('2', '3', 'Examen HAE', 'Fuah.... ¡Menuda follada! xD', '1', '1');











 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('11', 'Imagen', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('12', 'Sonido', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('13', 'Otros electrónica', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('21', NULL, 'Ordenadores', NULL, NULL, NULL, NULL, NULL, NULL),
  ('22', NULL, 'Microsoft Windows', NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('23', NULL, 'Linux', NULL, NULL, NULL, NULL, NULL, NULL),
  ('24', NULL, 'Mac OS', NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('25', NULL, 'Hardware', NULL, NULL, NULL, NULL, NULL, NULL),
  ('26', NULL, 'Software', NULL, NULL, NULL, NULL, NULL, NULL);  
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('27', NULL, 'Drivers', NULL, NULL, NULL, NULL, NULL, NULL),
  ('28', NULL, 'Tablets', NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('29', NULL, 'Otros informática', NULL, NULL, NULL, NULL, NULL, NULL);  

 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('31', NULL, NULL, 'IOS', NULL, NULL, NULL, NULL, NULL), 
  ('32', NULL, NULL, 'Android', NULL, NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('33', NULL, NULL, 'Windows Phone', NULL, NULL, NULL, NULL, NULL),
  ('34', NULL, NULL, 'Otros telefonía', NULL, NULL, NULL, NULL, NULL); 

 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('41', NULL, NULL, NULL, 'Fútbol', NULL, NULL, NULL, NULL),
  ('42', NULL, NULL, NULL, 'Baloncesto', NULL, NULL, NULL, NULL);  
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('43', NULL, NULL, NULL, 'Tenis', NULL, NULL, NULL, NULL),
  ('44', NULL, NULL, NULL, 'Balonmano', NULL, NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('45', NULL, NULL, NULL, 'Formula 1', NULL, NULL, NULL, NULL),
  ('46', NULL, NULL, NULL, 'Motociclismo', NULL, NULL, NULL, NULL); 
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('47', NULL, NULL, NULL, 'Otros deportes', NULL, NULL, NULL, NULL);  

 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('51', NULL, NULL, NULL, NULL, 'Perros', NULL, NULL, NULL),
  ('52', NULL, NULL, NULL, NULL, 'Gatos', NULL, NULL, NULL); 
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('53', NULL, NULL, NULL, NULL, 'Pájaros', NULL, NULL, NULL),
  ('54', NULL, NULL, NULL, NULL, 'Peces', NULL, NULL, NULL); 
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('55', NULL, NULL, NULL, NULL, 'Caballos', NULL, NULL, NULL),
  ('56', NULL, NULL, NULL, NULL, 'Veterinarios', NULL, NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('57', NULL, NULL, NULL, NULL, 'Otros animales', NULL, NULL, NULL);

 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('61', NULL, NULL, NULL, NULL, NULL, 'Videoconsolas', NULL, NULL),
  ('62', NULL, NULL, NULL, NULL, NULL, 'Videojuegos', NULL, NULL);
 INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('63', NULL, NULL, NULL, NULL, NULL, 'Juegos de mesa', NULL, NULL),
  ('64', NULL, NULL, NULL, NULL, NULL, 'Otros juegos', NULL, NULL);  

  INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('71', NULL, NULL, NULL, NULL, NULL, NULL, 'Coches', NULL),
   ('72', NULL, NULL, NULL, NULL, NULL, NULL, 'Motos', NULL);
  INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('73', NULL, NULL, NULL, NULL, NULL, NULL, 'Caravanas', NULL),
   ('74', NULL, NULL, NULL, NULL, NULL, NULL, 'Camiones', NULL);
  INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('75', NULL, NULL, NULL, NULL, NULL, NULL, 'Vehículos agrícolas', NULL),
   ('76', NULL, NULL, NULL, NULL, NULL, NULL, 'Repuestos', NULL);  
  INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES ('77', NULL, NULL, NULL, NULL, NULL, NULL, 'Otros motor', NULL);  

  INSERT INTO `tags` (`idTag`, `electrónica`, `informática`, `telefonía`, `deportes`, `mascotas`, `juegos`, `motor`, `otros`) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Otros');
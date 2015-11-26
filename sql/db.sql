USE ebsxjflv_igd;

CREATE TABLE IF NOT EXISTS `usuarios` (
	alias VARCHAR(20) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,	
	password VARCHAR(20) NOT NULL,
	email VARCHAR(50),
	PRIMARY KEY (alias)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `posts` (
  	idPost INTEGER NOT NULL AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	contenido VARCHAR(255),
  	fechaModificacion TIMESTAMP NOT NULL,
	fechaCreacion TIMESTAMP,
	usuario_alias VARCHAR(20) NOT NULL,
	PRIMARY KEY (`idPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `respuestas` (
	idRespuesta INTEGER NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(255) NOT NULL,
  	fechaModificacion TIMESTAMP NOT NULL,	
	fechaCreacion TIMESTAMP,
	usuario_alias VARCHAR(20) NOT NULL,	
	post_id INTEGER NOT NULL,		
	PRIMARY KEY (`idRespuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `votos` (
	usuario_alias VARCHAR(20) NOT NULL,
	respuesta_id INTEGER NOT NULL,
	PRIMARY KEY(`usuario_alias`, `respuesta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `favoritos` (
	usuario_alias VARCHAR(20) NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY(`usuario_alias`, `post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `visitas` (
	usuario_alias VARCHAR(20) NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY(`usuario_alias`, `post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `visitas` (
	usuario_alias VARCHAR(20) NOT NULL,
	post_id INTEGER NOT NULL,
	PRIMARY KEY(`usuario_alias`, `post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `smsPrivados` (
	usuario_emisor VARCHAR(20) NOT NULL,
	usuario_receptor VARCHAR(20) NOT NULL,
	cabecera VARCHAR(30),
	cuerpo VARCHAR(255),
	recibido TINYINT(1),
	enviado TINYINT(1),
	PRIMARY KEY(`usuario_emisor`, `usuario_receptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE posts
	ADD FOREIGN KEY (usuario_alias)
	REFERENCES usuarios (alias)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE respuestas
	ADD FOREIGN KEY (usuario_alias) 
	REFERENCES usuarios (alias),
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (idPost);

ALTER TABLE votos
	ADD FOREIGN KEY (usuario_alias) 
	REFERENCES usuarios (alias),
	ADD FOREIGN KEY (respuesta_id) 
	REFERENCES respuestas (idRespuesta);

ALTER TABLE favoritos
	ADD FOREIGN KEY (usuario_alias) 
	REFERENCES usuarios (alias)
	ON DELETE CASCADE
  	ON UPDATE CASCADE,
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (idPost)
	ON DELETE CASCADE
  	ON UPDATE CASCADE;

ALTER TABLE visitas
	ADD FOREIGN KEY (usuario_alias) 
	REFERENCES usuarios (alias),
	ADD FOREIGN KEY (post_id) 
	REFERENCES posts (idPost)
	ON DELETE CASCADE
  	ON UPDATE CASCADE;

ALTER TABLE smsPrivados
	ADD FOREIGN KEY (usuario_emisor) 
	REFERENCES usuarios (alias),
	ADD FOREIGN KEY (usuario_receptor) 
	REFERENCES usuarios (alias);


INSERT INTO `usuarios` (`alias`, `nombre`, `apellidos`, `password`, `email`) VALUES ('IGD1989', 'Isaac', 'González Domínguez', '123456', 'igdx1989@gmail.com'),
 ('diegoSelles', 'Diego', 'Rodríguez Sellés', '123456', 'diegoselles@gmail.com'),
 ('mltallon', 'Manuel', 'Lorenzo Tallón', '123456', 'mltallon@gmail.com');


INSERT INTO `posts` (`idPost`, `titulo`, `contenido`, `fechaModificacion`, `fechaCreacion`, `usuario_alias`) VALUES (NULL, 'Configuración UniServerZ', '¿Cómo se cambian los puertos en UniServerZ?', CURRENT_TIMESTAMP, '2015-11-26 22:53:13', 'mltallon');


INSERT INTO `respuestas` (`idRespuesta`, `contenido`, `fechaModificacion`, `fechaCreacion`, `usuario_alias`, `post_id`) VALUES (NULL, 'En el fichero de configuración de apache2.', CURRENT_TIMESTAMP, '2015-11-26 23:23:03', 'diegoSelles', '1');


INSERT INTO `visitas` (`usuario_alias`, `post_id`) VALUES ('IGD1989', '1'), ('diegoSelles', '1');

INSERT INTO `votos` (`usuario_alias`, `respuesta_id`) VALUES ('IGD1989', '1');

INSERT INTO `smsPrivados` (`usuario_emisor`, `usuario_receptor`, `cabecera`, `cuerpo`, `recibido`, `enviado`) VALUES ('IGD1989', 'diegoSelles', 'Entrega TSW', '¿Cómo llevais la entrega2 de TSW?', NULL, '1'),
 ('diegoSelles', 'mltallon', 'Examen HAE', 'Fuah.... ¡Menuda follada! xD', '1', '1');
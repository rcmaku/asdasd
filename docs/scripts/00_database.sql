
use betagaming;



CREATE TABLE
    `usuario` (
        `usercod` varchar(450) NOT NULL,
        `useremail` varchar(80) DEFAULT NULL,
        `username` varchar(80) DEFAULT NULL,
        `userpswd` varchar(128) DEFAULT NULL,
        `userfching` datetime DEFAULT NULL,
        `userpswdest` char(3) DEFAULT NULL,
        `userpswdexp` datetime DEFAULT NULL,
        `userest` char(3) DEFAULT NULL,
        `useractcod` varchar(128) DEFAULT NULL,
        `userpswdchg` varchar(128) DEFAULT NULL,
        `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
        PRIMARY KEY (`usercod`),
        UNIQUE KEY `useremail_UNIQUE` (`useremail`),
        KEY `usertipo` (
            `usertipo`,
            `useremail`,
            `usercod`,
            `userest`
        )
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles` (
        `rolescod` varchar(128) NOT NULL,
        `rolesdsc` varchar(45) DEFAULT NULL,
        `rolesest` char(3) DEFAULT NULL,
        PRIMARY KEY (`rolescod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles_usuarios` (
        `usercod` varchar(450) NOT NULL,
        `rolescod` varchar(128) NOT NULL,
        `roleuserest` char(3) DEFAULT NULL,
        `roleuserfch` datetime DEFAULT NULL,
        `roleuserexp` datetime DEFAULT NULL,
        PRIMARY KEY (`usercod`, `rolescod`),
        KEY `rol_usuario_key_idx` (`rolescod`),
        CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones` (
        `fncod` varchar(255) NOT NULL,
        `fndsc` varchar(255) DEFAULT NULL,
        `fnest` char(3) DEFAULT NULL,
        `fntyp` char(3) DEFAULT NULL,
        PRIMARY KEY (`fncod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones_roles` (
        `rolescod` varchar(128) NOT NULL,
        `fncod` varchar(255) NOT NULL,
        `fnrolest` char(3) DEFAULT NULL,
        `fnexp` datetime DEFAULT NULL,
        PRIMARY KEY (`rolescod`, `fncod`),
        KEY `rol_funcion_key_idx` (`fncod`),
        CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `bitacora` (
        `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
        `bitacorafch` datetime DEFAULT NULL,
        `bitprograma` varchar(255) DEFAULT NULL,
        `bitdescripcion` varchar(255) DEFAULT NULL,
        `bitobservacion` mediumtext,
        `bitTipo` char(3) DEFAULT NULL,
        `bitusuario` bigint(18) DEFAULT NULL,
        PRIMARY KEY (`bitacoracod`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;

CREATE TABLE
    `products` (
        `productId` bigint(11) NOT NULL AUTO_INCREMENT,
        `productName` varchar(255) NOT NULL,
        `productDescription` text NOT NULL,
        `productPrice` decimal(10, 2) NOT NULL,
        `productImgUrl` varchar(255) NOT NULL,
        `productStock` int(11) NOT NULL DEFAULT 0,
        `productStatus` char(3) NOT NULL,
        PRIMARY KEY (`productId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` varchar(450) NOT NULL,
        `productId` bigint(11) NOT NULL,
        `crrctd` INT(5) NOT NULL,
        `crrprc` DECIMAL(12, 2) NOT NULL,
        `crrfching` DATETIME NOT NULL,
        PRIMARY KEY (`usercod`, `productId`),
        INDEX `productId_idx` (`productId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );


CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `productId` bigint(11) NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `productId`),
        KEY `productIdx_id` (`productId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );
-- 

-- Elimina la tabla 'funciones_roles' si existe
DROP TABLE IF EXISTS `funciones_roles`;

-- Elimina la tabla 'funciones' si existe
DROP TABLE IF EXISTS `funciones`;

-- Crea la tabla 'funciones' con las siguientes columnas: fncod, fndsc, fnest, fntyp
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,  -- Código de la función (clave primaria)
  `fndsc` varchar(45) DEFAULT NULL, -- Descripción de la función
  `fnest` char(3) DEFAULT NULL, -- Estado de la función
  `fntyp` char(3) DEFAULT NULL, -- Tipo de función
  PRIMARY KEY (`fncod`) -- Establece la clave primaria en la columna 'fncod'
) ENGINE=InnoDB DEFAULT CHARSET=utf8; -- Motor de almacenamiento InnoDB, codificación utf8

-- Crea la tabla 'funciones_roles' con las siguientes columnas: rolescod, fncod, fnrolest, fnexp
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL, -- Código del rol (parte de la clave primaria)
  `fncod` varchar(255) NOT NULL, -- Código de la función (parte de la clave primaria)
  `fnrolest` char(3) DEFAULT NULL, -- Estado de la función en relación al rol
  `fnexp` datetime DEFAULT NULL, -- Fecha de expiración de la función
  PRIMARY KEY (`rolescod`,`fncod`), -- Establece una clave primaria compuesta
  KEY `rol_funcion_key_idx` (`fncod`), -- Crea un índice en la columna 'fncod'
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION, -- Establece una restricción de clave externa en la columna 'rolescod' que referencia la tabla 'roles'
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION -- Establece una restricción de clave externa en la columna 'fncod' que referencia la tabla 'funciones'
) ENGINE=InnoDB DEFAULT CHARSET=utf8; -- Motor de almacenamiento InnoDB, codificación utf8

-- Modifica la tabla 'bitacora', cambiando el tipo de la columna 'bitprograma' a VARCHAR(255)
ALTER TABLE `bitacora` CHANGE `bitprograma` `bitprograma` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;



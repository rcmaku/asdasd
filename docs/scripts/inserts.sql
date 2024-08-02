-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 09:38:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kevstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('bitacora_DEL', 'Eliminar bitacora', 'ACT', 'FNC'),
('bitacora_DSP', 'Detalle de bitacora', 'ACT', 'FNC'),
('bitacora_INS', 'Agregar bitacora', 'ACT', 'FNC'),
('bitacora_UPD', 'Editar bitacora', 'ACT', 'FNC'),
('ControllersBitacoras\\Bitacora', 'Lista de Bitacora', 'ACT', 'CTR'),
('ControllersFuncioness\\Funciones', 'Lista de Funciones', 'ACT', 'CTR'),
('ControllersFunciones_roless\\Funciones_roles', 'Lista de Funciones_roles', 'ACT', 'CTR'),
('ControllersProductss\\Products', 'Lista de Products', 'ACT', 'CTR'),
('ControllersPurchasedetails\\Purchasedetail', 'Lista de Purchasedetail', 'ACT', 'CTR'),
('ControllersPurchases\\Purchase', 'Lista de Purchase', 'ACT', 'CTR'),
('ControllersRoless\\Roles', 'Lista de Roles', 'ACT', 'CTR'),
('ControllersRoles_usuarioss\\Roles_usuarios', 'Lista de Roles_usuarios', 'ACT', 'CTR'),
('ControllersUsuarios\\Usuario', 'Lista de Usuario', 'ACT', 'CTR'),
('Controllers\\Bitacoras\\Bitacora', 'Controllers\\Bitacoras\\Bitacora', 'ACT', 'CTR'),
('Controllers\\Bitacoras\\Bitacoras', 'Formulario de Bitacora', 'ACT', 'CTR'),
('Controllers\\Cart\\Agregar', 'Controllers\\Cart\\Agregar', 'ACT', 'CTR'),
('Controllers\\Funcioness\\Funciones', 'Controllers\\Funcioness\\Funciones', 'ACT', 'CTR'),
('Controllers\\Funcioness\\Funcioness', 'Formulario de Funciones', 'ACT', 'CTR'),
('Controllers\\Funciones_roless\\Funciones_roless', 'Formulario de Funciones_roles', 'ACT', 'CTR'),
('Controllers\\Inicio\\Inicio', 'Formulario de Inicio', 'ACT', 'CTR'),
('Controllers\\Productss\\Products', 'Controllers\\Productss\\Products', 'ACT', 'CTR'),
('Controllers\\Productss\\Productss', 'Formulario de Products', 'ACT', 'CTR'),
('Controllers\\Purchasedetails\\Purchasedetail', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', 'CTR'),
('Controllers\\Purchasedetails\\Purchasedetails', 'Formulario de Purchasedetail', 'ACT', 'CTR'),
('Controllers\\Purchases\\Purchase', 'Controllers\\Purchases\\Purchase', 'ACT', 'CTR'),
('Controllers\\Purchases\\Purchases', 'Formulario de Purchase', 'ACT', 'CTR'),
('Controllers\\Roless\\Roles', 'Controllers\\Roless\\Roles', 'ACT', 'CTR'),
('Controllers\\Roless\\Roless', 'Formulario de Roles', 'ACT', 'CTR'),
('Controllers\\Rolesusuarioss\\Rolesusuarios', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', 'CTR'),
('Controllers\\Rolesusuarioss\\Rolesusuarioss', 'Formulario de Bitacora', 'ACT', 'CTR'),
('Controllers\\Roles_usuarioss\\Roles_usuarioss', 'Formulario de Roles_usuarios', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuario', 'Controllers\\Usuarios\\Usuario', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuarios', 'Formulario de Usuario', 'ACT', 'CTR'),
('Controllers\\\\Store\\\\Agregar', 'Agregar a Carrito', 'ACT', 'FNC'),
('funciones_DEL', 'Eliminar funciones', 'ACT', 'FNC'),
('funciones_DSP', 'Detalle de funciones', 'ACT', 'FNC'),
('funciones_INS', 'Agregar funciones', 'ACT', 'FNC'),
('funciones_roles_DEL', 'Eliminar funciones_roles', 'ACT', 'FNC'),
('funciones_roles_DSP', 'Detalle de funciones_roles', 'ACT', 'FNC'),
('funciones_roles_INS', 'Agregar funciones_roles', 'ACT', 'FNC'),
('funciones_roles_UPD', 'Editar funciones_roles', 'ACT', 'FNC'),
('funciones_UPD', 'Editar funciones', 'ACT', 'FNC'),
('Menu_Bitacora', 'Menu_Bitacora', 'ACT', 'MNU'),
('Menu_Funciones', 'Menu_Funciones', 'ACT', 'MNU'),
('Menu_Funciones_roles', 'Menu_Funciones_roles', 'ACT', 'MNU'),
('Menu_Inicio', 'Menu_Inicio', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('Menu_Products', 'Menu_Products', 'ACT', 'MNU'),
('Menu_Purchase', 'Menu_Purchase', 'ACT', 'MNU'),
('Menu_Purchasedetail', 'Menu_Purchasedetail', 'ACT', 'MNU'),
('Menu_Roles', 'Menu_Roles', 'ACT', 'MNU'),
('Menu_Roles_usuarios', 'Menu_Roles_usuarios', 'ACT', 'MNU'),
('Menu_Usuario', 'Menu_Usuario', 'ACT', 'MNU'),
('products_DEL', 'Eliminar products', 'ACT', 'FNC'),
('products_DSP', 'Detalle de products', 'ACT', 'FNC'),
('products_INS', 'Agregar products', 'ACT', 'FNC'),
('products_UPD', 'Editar products', 'ACT', 'FNC'),
('purchasedetail_DEL', 'Eliminar purchasedetail', 'ACT', 'FNC'),
('purchasedetail_DSP', 'Detalle de purchasedetail', 'ACT', 'FNC'),
('purchasedetail_INS', 'Agregar purchasedetail', 'ACT', 'FNC'),
('purchasedetail_UPD', 'Editar purchasedetail', 'ACT', 'FNC'),
('purchase_DEL', 'Eliminar purchase', 'ACT', 'FNC'),
('purchase_DSP', 'Detalle de purchase', 'ACT', 'FNC'),
('purchase_INS', 'Agregar purchase', 'ACT', 'FNC'),
('purchase_UPD', 'Editar purchase', 'ACT', 'FNC'),
('roles_DEL', 'Eliminar roles', 'ACT', 'FNC'),
('roles_DSP', 'Detalle de roles', 'ACT', 'FNC'),
('roles_INS', 'Agregar roles', 'ACT', 'FNC'),
('roles_UPD', 'Editar roles', 'ACT', 'FNC'),
('roles_usuarios_DEL', 'Eliminar roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_DSP', 'Detalle de roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_INS', 'Agregar roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_UPD', 'Editar roles_usuarios', 'ACT', 'FNC'),
('usuario_DEL', 'Eliminar usuario', 'ACT', 'FNC'),
('usuario_DSP', 'Detalle de usuario', 'ACT', 'FNC'),
('usuario_INS', 'Agregar usuario', 'ACT', 'FNC'),
('usuario_UPD', 'Editar usuario', 'ACT', 'FNC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADM', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2025-04-17 17:31:58'),
('ADM', 'Controllers\\Usuarios\\Usuario', 'ACT', '2025-04-17 17:32:55'),
('ADMIN', 'bitacora_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'bitacora_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'bitacora_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'bitacora_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2025-04-17 14:22:48'),
('ADMIN', 'Controllers\\Funcioness\\Funciones', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Funciones_roless\\Funciones_roless', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Inicio\\Inicio', 'ACT', '2025-04-17 14:26:05'),
('ADMIN', 'Controllers\\Productss\\Products', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Productss\\Productss', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Purchases\\Purchase', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Purchases\\Purchases', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Roless\\Roles', 'ACT', '2025-04-17 17:26:36'),
('ADMIN', 'Controllers\\Roless\\Roless', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2025-04-17 17:34:17'),
('ADMIN', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2025-04-17 17:31:50'),
('ADMIN', 'Controllers\\Roles_usuarioss\\Roles_usuarioss', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Controllers\\Usuarios\\Usuario', 'ACT', '2025-04-17 17:33:04'),
('ADMIN', 'funciones_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_roles_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_roles_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_roles_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_roles_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'funciones_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'Menu_Bitacora', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Funciones', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Funciones_roles', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Inicio', 'ACT', '2025-04-17 14:26:05'),
('ADMIN', 'Menu_Products', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Purchase', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Purchasedetail', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Roles', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'Menu_Roles_usuarios', 'ACT', '2025-04-17 14:22:49'),
('ADMIN', 'products_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'products_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'products_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'products_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchasedetail_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchasedetail_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchasedetail_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchasedetail_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchase_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchase_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchase_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'purchase_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_usuarios_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_usuarios_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_usuarios_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'roles_usuarios_UPD', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'usuario_DEL', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'usuario_DSP', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'usuario_INS', 'ACT', '2025-04-17 14:31:52'),
('ADMIN', 'usuario_UPD', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'bitacora_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'Controllers\\Cart\\Agregar', 'ACT', '2030-04-18 22:07:29'),
('CLN', 'Controllers\\Inicio\\Inicio', 'ACT', '2025-04-17 14:26:05'),
('CLN', 'funciones_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'funciones_roles_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'Menu_Inicio', 'ACT', '2025-04-17 14:26:05'),
('CLN', 'products_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'purchasedetail_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'purchase_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'roles_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'roles_usuarios_DSP', 'ACT', '2025-04-17 14:31:52'),
('CLN', 'usuario_DSP', 'ACT', '2025-04-17 14:31:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `productId` bigint(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStock` int(11) NOT NULL DEFAULT 0,
  `productStatus` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` varchar(450) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `details` varchar(450) DEFAULT NULL,
  `usercod` varchar(250) DEFAULT NULL,
  `payments` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `purchase`
--
-----------------------------------------------------

--
-- Estructura de tabla para la tabla `purchasedetail`
--

CREATE TABLE `purchasedetail` (
  `id_purchase` varchar(250) NOT NULL,
  `id_item_reference` varchar(250) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unitary_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `purchasedetail`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADM', 'Administrador', 'ACT'),
('ADMIN', 'Administrador', 'ACT'),
('CLN', 'Cliente', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` varchar(450) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
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
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--


--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `AutoRol` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    INSERT INTO roles_usuarios (usercod, rolescod, roleuserest,	roleuserfch, roleuserexp)
    VALUES (NEW.usercod, 'CLN', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR));
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`);

--
-- Indices de la tabla `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD PRIMARY KEY (`id_purchase`,`id_item_reference`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `productId` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD CONSTRAINT `purchasedetail_ibfk_1` FOREIGN KEY (`id_purchase`) REFERENCES `purchase` (`id_purchase`);

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



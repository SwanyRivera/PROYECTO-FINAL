-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2023 a las 07:15:03
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basefinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_marca` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id_marca`, `descripcion`, `tipo`) VALUES
(1, 'Kingston', 'Original'),
(2, 'Kingston', 'Generico'),
(3, 'Asus', 'Original');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categoria`, `descripcion`) VALUES
(1, 'Memorias USB'),
(2, 'Monitores'),
(3, 'Mouse');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `NIT` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `portal` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`NIT`, `nombre`, `direccion`, `telefono`, `correo`, `portal`) VALUES
(12345678, 'Cuilapa Tech', 'Cuilapa', '78569823', 'compras@cuilapatech.com', 'www.cuilapatech.com'),
(88547123, 'Flor Sales', 'Barberena', '41853365', 'florjuliana@gmail.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id_cliente`, `nombre`, `direccion`, `correo`, `NIT`) VALUES
(1, 'Boris', 'Barberena', 'blopez22@gmail.com', 52551233),
(2, 'Valeria', 'Nueva Santa Rosa', 'vavaleria@gmail.com', 44368512);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id_inventario` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `stock_in` int(11) NOT NULL,
  `entries` int(11) NOT NULL,
  `outlets` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id_inventario`, `date_in`, `date_out`, `stock_in`, `entries`, `outlets`, `id_producto`) VALUES
(1, '2022-06-09', '2023-02-16', 20, 50, 30, 2),
(2, '2022-10-13', '2023-03-02', 8, 10, 2, 1),
(3, '2022-09-16', '2023-06-30', 5, 5, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `imagen` mediumblob DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `descripcion`, `imagen`, `id_categoria`, `id_marca`) VALUES
(1, 'Datatraveler Max 512 GB', NULL, 1, 1),
(2, 'Datatraveler 3.0 32 GB', NULL, 1, 2),
(3, 'ProArt Display', NULL, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rates`
--

CREATE TABLE `rates` (
  `id_rate` int(11) NOT NULL,
  `costo` double NOT NULL,
  `precio` double NOT NULL,
  `rt_state` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `rates`
--

INSERT INTO `rates` (`id_rate`, `costo`, `precio`, `rt_state`, `id_producto`) VALUES
(1, 2500, 4000, 'activo', 3),
(2, 700, 100, 'activo', 1),
(3, 50, 110, 'activo', 2),
(4, 2500, 4500, 'Inactivo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_d`
--

CREATE TABLE `sales_d` (
  `id` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `id_producto` int(11) NOT NULL,
  `factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `sales_d`
--

INSERT INTO `sales_d` (`id`, `cantidad`, `id_producto`, `factura`) VALUES
(1, '2', 1, 423501),
(2, '20', 2, 452000),
(3, '10', 2, 454585);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_h`
--

CREATE TABLE `sales_h` (
  `factura` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `codigo_cliente` int(11) NOT NULL,
  `NIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `sales_h`
--

INSERT INTO `sales_h` (`factura`, `serie`, `fecha`, `codigo_cliente`, `NIT`) VALUES
(423501, 5, '2023-02-09 11:17:50', 2, 88547123),
(452000, 2, '2023-01-11 22:19:42', 1, 12345678),
(454585, 2, '2023-04-06 22:18:13', 1, 12345678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usser`
--

CREATE TABLE `usser` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `usser` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pswd` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `tipo_usuario` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `usser`
--

INSERT INTO `usser` (`id`, `nombre`, `apellido`, `usser`, `pswd`, `tipo_usuario`) VALUES
(1, 'Ruben', 'Lopez', 'rublo01', '12345', 'contador'),
(2, 'Karla', 'Garcia', 'karrcia', 'k1111', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `products_fk_2` (`id_producto`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `brands_fk` (`id_marca`),
  ADD KEY `categories_fk` (`id_categoria`);

--
-- Indices de la tabla `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id_rate`),
  ADD KEY `products_fk_3` (`id_producto`);

--
-- Indices de la tabla `sales_d`
--
ALTER TABLE `sales_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_h_fk` (`factura`),
  ADD KEY `products_fk` (`id_producto`);

--
-- Indices de la tabla `sales_h`
--
ALTER TABLE `sales_h`
  ADD PRIMARY KEY (`factura`),
  ADD KEY `customers_fk` (`codigo_cliente`),
  ADD KEY `company_fk` (`NIT`);

--
-- Indices de la tabla `usser`
--
ALTER TABLE `usser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rates`
--
ALTER TABLE `rates`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sales_d`
--
ALTER TABLE `sales_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sales_h`
--
ALTER TABLE `sales_h`
  MODIFY `factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454586;

--
-- AUTO_INCREMENT de la tabla `usser`
--
ALTER TABLE `usser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `products_fk_2` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brands_fk` FOREIGN KEY (`id_marca`) REFERENCES `brands` (`id_marca`),
  ADD CONSTRAINT `categories_fk` FOREIGN KEY (`id_categoria`) REFERENCES `categories` (`id_categoria`);

--
-- Filtros para la tabla `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `products_fk_3` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`);

--
-- Filtros para la tabla `sales_d`
--
ALTER TABLE `sales_d`
  ADD CONSTRAINT `products_fk` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`),
  ADD CONSTRAINT `sales_h_fk` FOREIGN KEY (`factura`) REFERENCES `sales_h` (`factura`);

--
-- Filtros para la tabla `sales_h`
--
ALTER TABLE `sales_h`
  ADD CONSTRAINT `company_fk` FOREIGN KEY (`NIT`) REFERENCES `company` (`NIT`),
  ADD CONSTRAINT `customers_fk` FOREIGN KEY (`codigo_cliente`) REFERENCES `customers` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

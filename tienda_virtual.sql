-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2024 a las 06:13:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_virtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`) VALUES
(1, 'T_shirt', 'https://static.vecteezy.com/system/resources/thumbnails/008/533/235/small_2x/black-t-shirt-mockup-cutout-file-png.png'),
(2, 'Jeans', 'https://portalropaempresas.cl/wp-content/uploads/2018/09/jeans-denim-trabajo-hombre--400x400.jpg'),
(3, 'Tenis', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a3e7dead-1ad2-4c40-996d-93ebc9df0fca/tenis-dunk-low-retro-5FQWGR.png'),
(4, 'Reloj', 'https://images.bidcom.com.ar/resize?src=https://www.bidcom.com.ar/publicacionesML/productos/RELMO034/1000x1000-RELMO034.jpg&h=400&q=100'),
(5, 'Gorras', 'https://do.lidomshop.com/wp-content/uploads/sites/4/2022/01/black.jpg'),
(6, 'Gafas', 'https://ae01.alicdn.com/kf/Sa08460e3ecc84d88bbb5e1a4e8b6a376O/Gafas-de-sol-cl-sicas-de-estilo-ojo-de-gato-para-mujer-lentes-de-sol-de.jpeg'),
(7, 'Camisas', 'https://www.giftcampaign.es/media/catalog/product/cache/1/small_image/400x/040ec09b1e35df139433887a97daa66f/p/f/pf38162506_yl.jpg'),
(8, 'Abrigos', 'https://www.lubeseguridad.com.ar/thumb/000000000000193187053campera-abrigo-trucker-impermeable-parka-capucha-1931-lube-seguridad_400x400.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(2, 'Darlin Manuel', 'darlinlvaldez@gmail.com', '$2y$10$SgOmRC37uUA0Tg5/I81A3.N3zJZK3VmFqOjy0zUoc5LBibXp4LIJi', 'default.png', '666be3f025fd44782866285f62c60e50', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `email_user` varchar(80) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `id_categoria`) VALUES
(1, 'Nike Dri-FIT Men\'s Fitness', 'Nike Dri-FIT Men\'s Fitness T-Shirt', 35.00, 20, 'https://static.nike.com/a/images/t_default/d5de1eda-1284-49b7-b420-e04b19abe5da/M+NK+DF+TEE+2+YR+SWOOSH.png', 1),
(2, 'Jean de Mezclilla Moda', 'Pantalón Para Mujer Jean de Mezclilla Moda', 44.99, 21, 'https://i.ebayimg.com/images/g/NwoAAOSwxc5jjygu/s-l400.jpg', 2),
(3, 'JORDAN 1 MID NEGRO ROJO', 'JORDAN 1 MID NEGRO ROJO', 108.97, 856, 'https://i.pinimg.com/474x/af/19/af/af19af6e8bbb4d510992db92c192e1fb.jpg', 3),
(4, 'Reloj Para Hombre Gadnic EOLO', 'Reloj Para Hombre Gadnic EOLO Resistente al Agua con Cronógrafo', 50.00, 13, 'https://images.bidcom.com.ar/resize?src=https://www.bidcom.com.ar/publicacionesML/productos/RELMO034/1000x1000-RELMO034.jpg&h=400&q=100', 4),
(5, 'Gorra Negra de los New York Yankees de New Era\n', 'La gorra negra de los New York Yankees de New Era es un accesorio emblemático que combina estilo y tradición.', 23.99, 40, 'https://dojiw2m9tvv09.cloudfront.net/92867/product/M_bnshot17wbpbk-11219.png?6&time=1721244746', 5),
(6, 'Gafas De Sol Cat.3 UV400 ', 'Gafas De Sol Cat.3 UV400 Gradient Lens Copper Frame Exteriores Sports Shades Pilot', 20.00, 35, 'https://ae01.alicdn.com/kf/Sa08460e3ecc84d88bbb5e1a4e8b6a376O/Gafas-de-sol-cl-sicas-de-estilo-ojo-de-gato-para-mujer-lentes-de-sol-de.jpeg', 6),
(7, 'Camisa oversize', 'Camisa oversize Signature, largo túnica', 28.99, 9, 'https://cdn.laredoute.com/cdn-cgi/image/width=400,height=400,fit=pad,dpr=1/products/1/7/8/178ec5caaf6161581b3c78c5e5d06eab.jpg', 7),
(8, 'ABRIGO TRUCKER IMPERMEABLE', '\r\nCAMPERA DE ABRIGO TRUCKER IMPERMEABLE AZUL MARINO TIPO PARKA C/CAPUCHA NACIONAL', 59.99, 16737, 'https://www.lubeseguridad.com.ar/thumb/000000000000193187053campera-abrigo-trucker-impermeable-parka-capucha-1931-lube-seguridad_400x400.jpg', 8),
(9, 'Nike Jordan Essentials Women\'s\r\n', 'Nike Jordan Essentials Women\'s', 23.99, 0, 'https://cdn.mall.adeptmind.ai/https%3A%2F%2Fimages.footlocker.com%2Fis%2Fimage%2FEBFL2%2FF3565010_medium.webp', 1),
(10, 'T-Shirt Fila Blanca', 'La T-shirt blanca Fila combina simplicidad y estilo clásico en una prenda versátil. Confeccionada en algodón de alta calidad, ofrece una comodidad excepcional y un ajuste perfecto. ', 9.99, 50, 'https://cdn.laredoute.com/cdn-cgi/image/width=400,height=400,fit=pad,dpr=1/products/4/2/9/429ccc5411a952f51b8c222ebf822f65.jpg', 1),
(11, 'T-Shirt Jordan', 'Camiseta con diseño gráfico vintage, disponible en varios colores.', 14.99, 40, 'https://m.media-amazon.com/images/I/315Urbc43uL._SS400_.jpg', 1),
(12, 'T-Shirt Adidas', 'La T-shirt blanca Adidas es la opción ideal para quienes buscan estilo y comodidad en una prenda básica.', 19.99, 30, 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwa43443a9/sss/SSS2/A/D/I/A/4/SSS2_ADIA4846_4066745585833_1.jpg?sw=400&sh=400&sm=fit', 1),
(13, 'T-Shirt Jordan Manga Larga', 'La T-shirt negra de manga larga Jordan ofrece un estilo deportivo con un toque moderno. ', 12.99, 20, 'https://i.ebayimg.com/images/g/0xIAAOSwbW5etKIV/s-l400.jpg', 1),
(14, 'T-Shirt Premium', 'Camiseta de alta calidad con ajuste perfecto y suave al tacto.', 24.99, 25, 'https://static.nike.com/a/images/t_default/e62351c8-e193-4ee2-a67b-58205f760db4/M+NSW+PREM+ESSNTL+SUST+TEE.png', 1),
(15, 'Jeans Skinny Fit', 'Jeans de corte ajustado, disponibles en varios colores.', 39.99, 60, 'https://i2.offers.gallery/p-27-02-2702f12583df65dc31bf796121f77768400x400/guess-jeansy-finnley-m4gas2-d4z25-niebieski-slim-fit400x400.jpg', 2),
(16, 'Jeans Clásicos', 'Jeans de corte clásico, perfectos para cualquier ocasión.', 29.99, 70, 'https://i.ebayimg.com/thumbs/images/g/dY8AAOSwCmVkW8gh/s-l1200.jpg', 2),
(17, 'Jeans Rotos', 'Jeans con detalles desgastados para un look casual y moderno.', 34.99, 50, 'https://www.ostu.com/dw/image/v2/BHFM_PRD/on/demandware.static/-/Sites-storefront_catalog_ostu/default/dw05ea1375/images/hi-res/Todo/jeans-mujer-40160256-5484_1.jpg?sw=400&sh=400', 2),
(18, 'Jeans de Tiro Alto', 'Jeans con tiro alto, ideal para combinar con blusas cortas.', 44.99, 40, 'https://i.ebayimg.com/thumbs/images/g/R2EAAOSwBIRmKA6S/s-l1200.jpg', 2),
(19, 'Jeans Bootcut', 'Jeans con corte de bota, ideales para usar con botas o tacones.', 49.99, 30, 'https://images-cdn.ubuy.co.in/635f8be1d7e0e404f435af92-level-7-men-relaxed-bootcut-premium.jpg', 2),
(20, 'Tenis Deportivos', 'Tenis ligeros y cómodos, perfectos para correr y actividades deportivas.', 59.99, 45, 'https://i.ebayimg.com/images/g/YxEAAOSwsUVig61z/s-l400.jpg', 3),
(21, 'Fila Disruptor', 'Los Fila Disruptor son la mezcla perfecta de estilo retro y comodidad moderna. Con su icónico diseño de suela chunky y detalles en contraste, estos tenis ofrecen una apariencia audaz y llamativa.', 49.99, 60, 'https://i.pinimg.com/474x/90/e3/0b/90e30be9a1acb7a432cb3fc4968f3af2.jpg', 3),
(22, 'Tenis de Moda', 'Tenis modernos con diseño único, ideales para destacar.', 69.99, 35, 'https://i.pinimg.com/originals/5c/f1/0e/5cf10ecc116d439c8e7712af8e58cc4d.jpg', 3),
(23, 'Tenis Running', 'Tenis especializados para running, con soporte extra y amortiguación.', 79.99, 25, 'https://static.nike.com/a/images/t_default/12ecea9e-4f89-4c48-b556-4b32fea71ef0/tenis-de-correr-en-carretera-zoom-fly-5-ShXjdb.png', 3),
(24, 'Tenis Retro', 'Tenis con diseño retro, perfectos para un look vintage.', 54.99, 40, 'https://images-na.ssl-images-amazon.com/images/I/71bxxyDi69L._SS400_.jpg', 3),
(25, 'Reloj Deportivo', 'Reloj resistente al agua, con cronómetro y múltiples funciones deportivas.', 89.99, 15, 'https://zafirosperuimport.com/cdn/shop/files/gsc_123780723_3738488_1.jpg?v=1697301427&width=533', 4),
(26, 'Reloj Clásico', 'Reloj clásico de acero inoxidable con correa de cuero.', 129.99, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX2tSoPH5AgaGrwEZqkwyEtmHXg8O4CX0XzA&s', 4),
(27, 'Reloj Inteligente', 'Reloj inteligente con pantalla táctil y múltiples aplicaciones.', 199.99, 10, 'https://casacuesta.com/media/catalog/product/cache/afcac67a0d77755283578b677f040f2b/3/3/3338859-1.jpg', 4),
(28, 'Reloj de Buceo', 'Reloj especializado para buceo, resistente hasta 200 metros.', 249.99, 8, 'https://images-na.ssl-images-amazon.com/images/I/81tk8hbewrL._SS400_.jpg', 4),
(29, 'Reloj de Moda', 'Reloj con diseño elegante, ideal para ocasiones formales.', 149.99, 12, 'https://www.dhresource.com/webp/m/0x0/f2/albu/g8/M01/9B/35/rBVaV1wSD6qAVgVJAAMPvcvR3QI652.jpg', 4),
(30, 'Chicago Bulls New Era', 'Gorra de algodón en varios colores, ideal para uso diario.', 14.99, 50, 'https://statoord.com/4405-medium_default/snapback-basica-chicago-bulls.jpg', 5),
(31, 'Cleveland Cavaliers New Era', 'La gorra Cleveland Cavaliers New Era es un accesorio esencial para los fanáticos de los Cavaliers y para aquellos que aprecian la moda deportiva', 19.99, 40, 'https://i0.wp.com/nuevodiario-assets.s3.us-east-2.amazonaws.com/wp-content/uploads/2017/07/Gigantes-del-Cibao-y-Gorra-NE.jpg?resize=400%2C400&quality=100&ssl=1', 5),
(32, 'Gorra de Moda', 'Gorra con diseño moderno y detalles únicos.', 24.99, 30, 'https://i.ebayimg.com/images/g/1L8AAOSwPRBgk8Mo/s-l400.jpg', 5),
(33, 'Gorra Trucker', 'Gorra estilo trucker con malla trasera para mejor ventilación.', 17.99, 35, 'https://i.ebayimg.com/images/g/0isAAOSwj3NkRLCx/s-l400.jpg', 5),
(34, 'Gorra Snapback', 'Gorra estilo snapback con ajuste en la parte trasera.', 22.99, 25, 'https://www.basketballemotion.com/imagesarticulos/224919/medianas/gorra-mitchellness-team-2-tone-2.0-snapback-denver-nuggets-royal-red-0.jpg', 5),
(35, 'Gafas de Sol Clásicas', 'Gafas de sol con diseño clásico y protección UV.', 29.99, 50, 'https://zerouv.com/cdn/shop/products/C416-01d_400x.jpg?v=1641925213', 6),
(36, 'Gafas de Sol Deportivas', 'Gafas de sol ligeras y resistentes, perfectas para deportes.', 34.99, 40, 'https://es.finewelleyewear.com/uploads/202336042/small/fashion-cycling-sports-sunglasses172f641d-11a1-4ce1-a2da-fe2881981b02.jpg', 6),
(37, 'Gafas de Sol Polarizadas', 'Gafas de sol polarizadas que reducen el deslumbramiento.', 39.99, 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6kDRnqiCkvto2fXqgCizdAThJpLr7Fp2d1g&s', 6),
(38, 'Gafas de Lectura', 'Gafas de lectura con diseño elegante y lentes antirreflejos.', 19.99, 60, 'https://ae01.alicdn.com/kf/S5ffe769045434c70846719a099f7b760O/Gafas-de-lectura-bifocales-fotocrom-ticas-para-hombre-y-mujer-lentes-de-sol-con-lupa-marco.jpg', 6),
(39, 'Gafas de Seguridad', 'Gafas de seguridad con protección contra impactos y polvo.', 14.99, 50, 'https://decein.com/wp-content/uploads/2020/07/3m-sf400-00.jpg', 6),
(40, 'Camisa Formal Blanca', 'Camisa de vestir blanca, perfecta para eventos formales.', 29.99, 40, 'https://img.joomcdn.net/44387e222093f16b900b018be3bf723846f1c04a_400_400.jpeg', 7),
(41, 'Camisa Casual', 'Camisa de algodón con diseño casual, ideal para el día a día.', 24.99, 50, 'https://i.ebayimg.com/images/g/D5YAAOSwqr5dtrjk/s-l400.jpg', 7),
(42, 'Camisa de Lino', 'Camisa de lino, perfecta para climas cálidos.', 34.99, 30, 'https://cdn.laredoute.com/cdn-cgi/image/width=400,height=400,fit=pad,dpr=1/products/4/1/7/4177032ab52da717d9cdb1cf58e7bacf.jpg', 7),
(43, 'Camisa de Cuadros', 'Camisa con diseño de cuadros, ideal para un look casual.', 27.99, 35, 'https://www.ostu.com/dw/image/v2/BHFM_PRD/on/demandware.static/-/Sites-storefront_catalog_ostu/default/dwc3d4d1f2/images/hi-res/Todo/camisas-para-hombre-60010500-10_2.jpg?sw=400&sh=400', 7),
(44, 'Camisa Denim', 'Camisa de mezclilla, ideal para un look moderno y casual.', 32.99, 25, 'https://cdn.laredoute.com/cdn-cgi/image/width=400,height=400,fit=pad,dpr=1/products/0/d/c/0dc192e4c1c6f11e111ac3de01d013a4.jpg', 7),
(45, 'Abrigo de Invierno', 'Abrigo grueso y cálido, perfecto para el invierno.', 89.99, 20, 'https://casagrobas.com/wp-content/uploads/2018/11/chaqueta-seventy-degrees-sd-jc57-urban-caqui-invierno-400x400.jpg', 8),
(46, 'Abrigo de Lino', 'Abrigo ligero de lino, ideal para climas moderados.', 79.99, 15, 'https://ae01.alicdn.com/kf/H5f750dbe92494ba0874bb0df0ebee406B/Blusa-de-lino-y-algod-n-con-hebilla-china-para-mujer-abrigo-a-cuadros-chaqueta-gruesa.jpg', 8),
(47, 'Abrigo de Lana', 'Abrigo elegante de lana, ideal para ocasiones formales.', 129.99, 10, 'https://cdn.laredoute.com/cdn-cgi/image/width=400,height=400,fit=pad,dpr=1/products/c/9/a/c9a0e7157b692500c2ce8a80727be012.jpg', 8),
(48, 'Abrigo Trench', 'Abrigo estilo trench, con cinturón y diseño clásico.', 99.99, 25, 'https://falabella.scene7.com/is/image/Falabella/16859086_1', 8),
(49, 'Abrigo Casual', 'Abrigo casual con diseño moderno y cómodo.', 69.99, 30, 'https://www.giftcampaign.es/media/catalog/product/cache/1/small_image/400x/040ec09b1e35df139433887a97daa66f/s/t/st30180-103_yl.jpg', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

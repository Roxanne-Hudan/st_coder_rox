-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: st_coder_rox
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `consignas_pendientes`
--

DROP TABLE IF EXISTS `consignas_pendientes`;
/*!50001 DROP VIEW IF EXISTS `consignas_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consignas_pendientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!50001 DROP VIEW IF EXISTS `stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock` AS SELECT 
 1 AS `codigo`,
 1 AS `descripcion`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `solicitudes_material_cliente`
--

DROP TABLE IF EXISTS `solicitudes_material_cliente`;
/*!50001 DROP VIEW IF EXISTS `solicitudes_material_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `solicitudes_material_cliente` AS SELECT 
 1 AS `numero_movimiento`,
 1 AS `unidad`,
 1 AS `descripcion`,
 1 AS `cantidad`,
 1 AS `fecha_de_entrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_servicios`
--

DROP TABLE IF EXISTS `vista_servicios`;
/*!50001 DROP VIEW IF EXISTS `vista_servicios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_servicios` AS SELECT 
 1 AS `numero_servicio`,
 1 AS `nombre`,
 1 AS `razon_social`,
 1 AS `fecha_de_servicio`,
 1 AS `tipo_de_servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vacaciones_tomadas`
--

DROP TABLE IF EXISTS `vacaciones_tomadas`;
/*!50001 DROP VIEW IF EXISTS `vacaciones_tomadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vacaciones_tomadas` AS SELECT 
 1 AS `numero_movimiento`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `dias_disfrutados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `servicios_pendientes`
--

DROP TABLE IF EXISTS `servicios_pendientes`;
/*!50001 DROP VIEW IF EXISTS `servicios_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `servicios_pendientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `consignas_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `consignas_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consignas_pendientes` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `razon_social` from (`clientes` `c` left join `consignas` `co` on((`c`.`id_cliente` = `co`.`id_cliente`))) where (`co`.`id_cliente` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock`
--

/*!50001 DROP VIEW IF EXISTS `stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock` AS select `i`.`codigo` AS `codigo`,`e`.`descripcion` AS `descripcion`,sum(`i`.`cantidad`) AS `stock` from (`inventario` `i` join `equipos_material` `e` on((`i`.`codigo` = `e`.`codigo`))) group by `i`.`codigo`,`e`.`descripcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `solicitudes_material_cliente`
--

/*!50001 DROP VIEW IF EXISTS `solicitudes_material_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `solicitudes_material_cliente` AS select `s`.`numero_movimiento` AS `numero_movimiento`,`c`.`unidad` AS `unidad`,`e`.`descripcion` AS `descripcion`,`s`.`cantidad` AS `cantidad`,`s`.`fecha_de_entrega` AS `fecha_de_entrega` from ((`solicitud_material` `s` join `clientes` `c` on((`s`.`id_cliente` = `c`.`id_cliente`))) join `equipos_material` `e` on((`s`.`codigo` = `e`.`codigo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_servicios`
--

/*!50001 DROP VIEW IF EXISTS `vista_servicios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_servicios` AS select `bs`.`numero_servicio` AS `numero_servicio`,`t`.`nombre` AS `nombre`,`c`.`razon_social` AS `razon_social`,`bs`.`fecha_de_servicio` AS `fecha_de_servicio`,`bs`.`tipo_de_servicio` AS `tipo_de_servicio` from ((`base_de_servicio` `bs` join `tecnicos` `t` on((`bs`.`id_tecnico` = `t`.`id_tecnico`))) join `clientes` `c` on((`bs`.`id_cliente` = `c`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vacaciones_tomadas`
--

/*!50001 DROP VIEW IF EXISTS `vacaciones_tomadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vacaciones_tomadas` AS select `v`.`numero_movimiento` AS `numero_movimiento`,`t`.`nombre` AS `nombre`,`t`.`apellido` AS `apellido`,`v`.`dias_disfrutados` AS `dias_disfrutados` from (`vacaciones_tecnicos` `v` join `tecnicos` `t` on((`v`.`id_tecnico` = `t`.`id_tecnico`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `servicios_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `servicios_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `servicios_pendientes` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `razon_social` from (`clientes` `c` left join `base_de_servicio` `b` on((`c`.`id_cliente` = `b`.`id_cliente`))) where (`b`.`id_cliente` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-18 19:10:14

import 'package:erp/app_antigo/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:requester/config/pws_config.dart';

class Application {
  static ThemeData theme = DefaultTheme.get();

   // CLIENTS APIs
  static late PWSConfig pwsConfigWaychef;
  static late PWSConfig pwsConfigGateway;
  static String tokenClient = "";
  static String tokenUsuario = "";
}

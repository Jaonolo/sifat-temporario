import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';
import 'package:waycard/theme/default_theme.dart';

class AppConfig {
  static ThemeData theme = DefaultTheme.get();

  static get globalContext => globalKey.currentContext;
  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  static Application application = Application.getInstance()
    ..client = Clients.WAYCARD
    ..pwsConfigWaychef = PWSConfig(
        urlBase: "http://api.jose/api",
        client: Clients.WAYCARD,
        clientSecret: Clients.WAYCARD.clientKey
    );
}

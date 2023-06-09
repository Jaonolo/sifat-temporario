import 'package:models/model/enum/clients.dart';

class PWSConfig {
  String urlBase;
  Clients client;
  String clientSecret;
  String urlBaseSecundaria = "";
  bool utilizaUrlBaseSecundaria = false;
  Function? redirect;

  PWSConfig({required this.urlBase,
    required this.client,
    required this.clientSecret,
    this.urlBaseSecundaria = "",
    this.utilizaUrlBaseSecundaria = false});

  String getUrlBase() {
    return utilizaUrlBaseSecundaria ? urlBaseSecundaria : urlBase;
  }

  void ativaUrlSecundaria() {
    if (urlBaseSecundaria.isEmpty) return;

    utilizaUrlBaseSecundaria = !utilizaUrlBaseSecundaria;
  }
}

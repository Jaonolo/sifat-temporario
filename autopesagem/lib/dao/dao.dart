import 'package:autopesagem/config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetValue {
  static Future<void> getValuesFuncao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final hostValueWaychef = await prefs.getString("hostWaychef");
    final hostValueGateway = await prefs.getString("hostGateway");
    final clientSecretValue = await prefs.getString("clientSecret");
    AppConfig.urlApiWaychef = hostValueWaychef ?? "";
    AppConfig.urlApiGateway = hostValueGateway ?? "";
    AppConfig.clientSecret = clientSecretValue ?? "";
  }
}

class PutValue {
  static Future<void> setValues(String host,String hostGateway, String clientSecret) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("hostWaychef", host);
    await prefs.setString("hostGateway", hostGateway);
    //salva o gateway
    await prefs.setString("clientSecret", clientSecret);
  }
}

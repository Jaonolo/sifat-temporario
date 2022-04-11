import 'package:autopesagem/config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetValue {
  static Future<void> getValuesFuncao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final hostValue = await prefs.getString("host");
    final clientSecretValue = await prefs.getString("clientSecret");
    AppConfig.urlApi = hostValue!;
    AppConfig.clientSecret = clientSecretValue!;
  }
}

class PutValue {
  static Future<void> setValues(String host, String clientSecret) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("host", host);
    await prefs.setString("clientSecret", clientSecret);
  }
}

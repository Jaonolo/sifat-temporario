import 'package:erp/app_antigo/rotas/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters do app antigo');
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
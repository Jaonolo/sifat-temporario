import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/consumo_requester.dart';
import 'package:autoatendimento/app/app_controller.dart';

class NotaItemRepository {
  static AppController appController = Modular.get();

  static Future<List<NotaItem>> inserir(List<NotaItem> listItens) async {
    return await ConsumoRequester.inserirItens(
        appController.pwsConfig, appController.tokenClient, listItens)
        .then((response) {
      if (response.isSuccess) {
        List<NotaItem> list = response.content;
        return list;
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      print(e);

      print(s);
      throw e;
    });
  }
}

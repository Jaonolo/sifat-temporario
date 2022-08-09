import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/pendencia_requester.dart';

part 'pendencia_fiscal_controller.g.dart';

class PendenciaFiscalController = PendenciaFiscalBase
    with _$PendenciaFiscalController;

abstract class PendenciaFiscalBase with Store {
  static AppController appController = Modular.get();

  @observable
  late ObservableList<Pendencia> pendencias = ObservableList();

  String totalPedidos = '';

  String lblTotal = "";

  @action
  Future<void> adicionarPendencias(List<Pendencia> pendencia) async {
    if (pendencia.isNotEmpty) {
      pendencias.addAll(pendencia);
    }
  }

  @action
  Future<List<Pendencia>> carregaPendencias() async {
    return await PendenciaRequester.buscar(
            appController.pwsConfig, appController.token, pendencias.length)
        .then((response) {
      if (response.status == 200) {
        adicionarPendencias(response.content);
        print(pendencias.length);
        lblTotal = "Total: ${pendencias.length.toString()} / ${totalPedidos}";
        return pendencias;
      } else if (response.status == 204) {
        print(response.content);
        return [];
      } else {
        throw PwsException(response.content);
      }
    });
  }

  @action
  existePendencia() async {
    return await PendenciaRequester.existePendencias(
            appController.pwsConfig, appController.token)
        .then((response) {
      if (response.status == 200) {
        totalPedidos = response.body.toString();
        return totalPedidos;
      } else if (response.status == 204) {
        print(response.content);
        return [];
      } else {
        throw PwsException(response.content);
      }
    });
  }
}

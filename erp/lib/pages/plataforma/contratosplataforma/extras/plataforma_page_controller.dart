import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:erp/pages/routes/app_pages.dart';

import '../../../../models/item_configurcao_waychef.dart';
import '../../../../requester/plataforma_requester.dart';

class PlataformaPageController extends GetxController {


//-------------------------------------------------- FUNÇÕES

  final _carregando = false.obs;

  bool get carregando => _carregando.value;

  set carregando(value) => _carregando.value = value;

  final _listaPlataformaContratoExtra = <ItemConfiguracaoWaychef>[].obs;

  List<ItemConfiguracaoWaychef> get listaPlataformaContratoExtra => _listaPlataformaContratoExtra.toList();

  set listaPlataformaContratoExtra(value) => _listaPlataformaContratoExtra.value = value;

//-------------------------------------------------- FUNÇÕES --------------------------------------------------------------

  @override
  void onInit() {
    super.onInit();
    _buscarPlataformaContratoExtra();
  }

  void _buscarPlataformaContratoExtra() async {
    carregando = true;
    await PlataformaRequester.buscarPlataformaContratoExtra().then((value) {
      if (value.isSuccess) {
        _listaPlataformaContratoExtra.addAll(value.content);
      } else {
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar empresas');
      }
    });
    carregando = false;
  }

  void onSort(int columnIndex, bool ascending) {
    var _listaOrdenada = listaPlataformaContratoExtra;
    switch (columnIndex) {
      case 0:
        break;
      case 1:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.descricao!, empresa2.descricao!);
        });
        listaPlataformaContratoExtra = _listaOrdenada;
        break;
      // case 2:
      //   _listaOrdenada.sort((empresa1, empresa2) {
      //     return _compareString(
      //         ascending, empresa1.cnpj, empresa2.cnpj);
      //   });
      //   listaEmpresas = _listaOrdenada;
      //   break;
      // case 3:
      //   _listaOrdenada.sort((empresa1, empresa2) {
      //     return _compareString(
      //         ascending, empresa1.cnpj, empresa2.cnpj);
      //   });
      //   listaEmpresas = _listaOrdenada;
      //   break;
      // case 4:
      //   _listaOrdenada.sort((empresa1, empresa2) {
      //     return _compareString(
      //         ascending, empresa1.cnpj, empresa2.cnpj);
      //   });
      //   listaPlataformaContratoExtra = _listaOrdenada;
      //   break;
      default:
        break;
    }
  }

  int _compareString(bool ascending, String value1, String value2) {
    if (value1 != null && value2 != null) {
      return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
    }
    return 0;
  }
  int compareDate(bool ascending, DateTime value1, DateTime value2) {
    if (value1 != null && value2 != null) {
      return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
    }
    return 0;
  }

}
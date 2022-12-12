
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:erp/pages/routes/app_pages.dart';

import '../../models/item_configurcao_waychef.dart';
import '../../models/plataformaintegrador/item_configuracao_integrador_waychef.dart';
import '../../requester/plataforma_requester.dart';
import '../../widgets/utils/widgets_utils.dart';

// void _editGame(int id) {
//   gameController.editGame(id);
// }

class PlataformaIntegradorPageController extends GetxController {


//-------------------------------------------------- FUNÇÕE

  final _carregando = false.obs;

  bool get carregando => _carregando.value;

  set carregando(value) => _carregando.value = value;

  final _listaPlataformaContratoIntegradorExtra = <ItemConfiguracaoIntegradorWaychef>[].obs;

  // final _atualizarItemConfiguracaoIntegrador = <ItemConfiguracaoIntegradorWaychef>[].obs;

  List<ItemConfiguracaoIntegradorWaychef> get listaPlataformaContratoIntegradorExtra => _listaPlataformaContratoIntegradorExtra.toList();

  set listaPlataformaContratoIntegradorExtra(value) => _listaPlataformaContratoIntegradorExtra.value = value;

//-------------------------------------------------- FUNÇÕES --------------------------------------------------------------

  @override
  void onInit() {
    super.onInit();
    _buscarPlataformaContratoIntegradorExtra();
    atualizarItemConfiguracaoIntegrador();
  }


  void _buscarPlataformaContratoIntegradorExtra() async {
    carregando = true;
    await PlataformaRequester.buscarPlataformaContratoIntegradorExtra().then((value) {
      if (value.isSuccess) {
        _listaPlataformaContratoIntegradorExtra.addAll(value.content);
      } else {
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar empresas');
      }
    });
    carregando = false;
  }


// REQUESTER PUT -> ANALISA MINHA FUNÇÃO CONTROLLER
    void atualizarItemConfiguracaoIntegrador() async {
    carregando = true;
    await PlataformaRequester.atualizarItemConfiguracaoIntegrador("token", _listaPlataformaContratoIntegradorExtra).then((value) {
      if (value.isSuccess) {
        _listaPlataformaContratoIntegradorExtra.addAll(value.content);
      } else {
        WidgetsUtils.snackBarError('Erro', 'Falha ao salvar lista');
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar empresas no sistema');
      }
    });
    carregando = false;
  }
//   void atualizarItemConfiguracaoIntegrador() async {
//     carregando = true;
//     await PlataformaRequester.atualizarItemConfiguracaoIntegrador("token", _listaPlataformaContratoIntegradorExtra).then((value) {
//       if (value.isSuccess) {
//         _listaPlataformaContratoIntegradorExtra.addAll(value.content);
//       } else {
//         WidgetsUtils.snackBarError('Erro', 'Falha ao salvar lista');
//         //TODO: verificar e trata possiveis erros
//         print('>>>>>> Erro ao carregar empresas no sistema');
//       }
//     });
//     carregando = false;
//   }

  void onSort(int columnIndex, bool ascending) {
    var _listaOrdenada = listaPlataformaContratoIntegradorExtra;
    switch (columnIndex) {
      case 0:
        break;
      case 1:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.idItemConfiguracaoWaychef!, empresa2.idItemConfiguracaoWaychef!);
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
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
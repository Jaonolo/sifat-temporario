import 'package:erp/config/application.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:requester/requester/micro-service/contrato/plataforma/contrato-integrador/plataforma_contratos_extras_integrador_requester.dart';
import 'package:models/model/models.dart';

import '../../../../app_antigo/config/application.dart';
import '../../../../widgets/utils/widgets_utils.dart';




class PlataformaPageController extends GetxController {


//-------------------------------------------------- FUNÇÕES

  final _boxEmpresateste = false.obs;

  get boxEmpresateste => _boxEmpresateste.value;
  void alternaBoxEmpresateste(String id, bool v) {
    mapDetalhes[id]!.podeComercializar = v;
    _boxEmpresateste.toggle();
  }

  final _carregando = false.obs;
  bool get carregando => _carregando.value;
  set carregando(value) => _carregando.value = value;

//-------- FUNÇÕES plataforma page
  final _listaPlataformaContratoIntegradorExtra = <ItemConfiguracaoIntegradorWaychef>[].obs;
  List<ItemConfiguracaoIntegradorWaychef> get listaPlataformaContratoIntegradorExtra => _listaPlataformaContratoIntegradorExtra.toList();
  set listaPlataformaContratoIntegradorExtra(value) => _listaPlataformaContratoIntegradorExtra.value = value;

  final _listaPlataformaContratoExtra = <ItemConfiguracaoWaychef>[].obs;
  List<ItemConfiguracaoWaychef> get listaPlataformaContratoExtra => _listaPlataformaContratoExtra.toList();
  set listaPlataformaContratoExtra(value) => _listaPlataformaContratoExtra.value = value;

  Map<String, ItemConfiguracaoIntegradorWaychef> mapDetalhes = new Map();
  Map<ModuloContratoIndicadorEnum, List<ItemConfiguracaoWaychef>> mapContratoIndicador = new Map();
  Map<dynamic, dynamic> mapControleCheckBox = {}.obs;


//-------------------------------------------------- FUNÇÕES --------------------------------------------------------------

  @override
  void onInit() {
    super.onInit();
    _buscarPlataformaContratoExtraIntegradores();
  }


  //   void _buscarPlataformaContratoExtraIntegradores() async {
  //   carregando = true;
  //   await PlataformaContratosExtrasIntegradorRequester.buscarTodosItensPorIdEmpresaETipoItem(Application.pwsConfigGateway, Application.tokenUsuario, "1" , "EXTRA").then((value) {
  //     if (value.isSuccess) {
  //       _listaPlataformaContratoExtra.addAll(value.content);
  //     } else {
  //       //TODO: verificar e trata possiveis erros
  //       print('>>>>>> Erro ao carregar empresas');
  //     }
  //   });
  //   carregando = false;
  // }

  void _buscarPlataformaContratoExtraIntegradores() async {
    print('cheguei no carregando');
    carregando = true;
    await PlataformaContratosExtrasIntegradorRequester.buscarTodosItensPorIdEmpresaETipoItem(Application.pwsConfigGateway, Application.tokenUsuario, "1" , "EXTRA").then((value) {
      print('entrei no if de buscar buscarTodosItensPorIdEmpresaETipoItem');
      if (value.isSuccess) {
        _listaPlataformaContratoIntegradorExtra.addAll(value.content);
        for (ItemConfiguracaoIntegradorWaychef value1 in _listaPlataformaContratoIntegradorExtra) {
          mapDetalhes[value1.itemConfiguracaoWaychefDTO.id!] = value1;
        }
      } else {
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar _buscarTodosItensPorIdEmpresaETipoItem');
      }
      print('>>>>>> mapDetalhes');
      print(mapDetalhes);
      print('>>>>>> mapDetalhes');
    });
    print('>>>>>> mapDetalhes 22222 ');
    print(mapDetalhes);
    print('>>>>>> mapDetalhes 22222 ');
    carregando = false;
  }

  void onSort(int columnIndex, bool ascending) {
    var _listaOrdenada = listaPlataformaContratoIntegradorExtra;
    switch (columnIndex) {
      case 0:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!, empresa2.itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!);
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 1:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.itemConfiguracaoWaychefDTO.nome!, empresa2.itemConfiguracaoWaychefDTO.nome!);
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 2:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.detalhes!, empresa2.detalhes!);
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 3:
        _listaOrdenada.sort((empresa1, empresa2) {
          return _compareString(
              ascending, empresa1.valor.toString(), empresa2.valor.toString());
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
    // case 4:
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



  // REQUESTER PUT -> ANALISA MINHA FUNÇÃO CONTROLLER
  void atualizarItemConfiguracaoIntegrador() async {
    carregando = true;
    List<ItemConfiguracaoIntegradorWaychef> listaPlataformaContratoDTO = [];
    mapDetalhes.forEach((key, value) {
      print('--itemContratoIntegrador.detalhes-----');
      print(value);
      listaPlataformaContratoDTO.add(value);
    });

    await PlataformaContratosExtrasIntegradorRequester.atualizarItemConfiguracaoIntegrador(
        Application.pwsConfigGateway, Application.tokenUsuario, listaPlataformaContratoDTO).then((value) {
          if (value.status == 200) {
            WidgetsUtils.snackBarSucesso('Sucesso', 'Lista atualizada');
          } else {
            WidgetsUtils.snackBarError('Erro', 'Falha ao salvar lista');
            //TODO: verificar e trata possiveis erros
          }
        });
          carregando = false;
    }



}
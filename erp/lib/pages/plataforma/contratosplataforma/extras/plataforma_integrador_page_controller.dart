import 'package:erp/config/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:erp/pages/routes/app_pages.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/micro-service/contrato/plataforma/contrato-plataforma/plataforma_contratos_requester.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../models/plataformaintegrador/item_configuracao_integrador_waychef.dart';
import '../../../../models/plataformaintegrador/item_configuracao_wayche_dto.dart';
import '../../../../requester/plataforma_requester.dart';
import '../../../../widgets/utils/widgets_utils.dart';

class PlataformaIntegradorPageController extends GetxController {

//--------- FUNÇÕES

  final ScrollController scrollTabBar = ScrollController();

  final _carregando = false.obs;
  bool get carregando => _carregando.value;
  set carregando(value) => _carregando.value = value;

  final _listaPlataformaContratoIntegradorExtra = <ItemConfiguracaoIntegradorWaychef>[].obs;
  List<ItemConfiguracaoIntegradorWaychef> get listaPlataformaContratoIntegradorExtra => _listaPlataformaContratoIntegradorExtra.toList();
  set listaPlataformaContratoIntegradorExtra(value) => _listaPlataformaContratoIntegradorExtra.value = value;

  final _listaPlataformaContratoAdicionais = <ItemConfiguracaoWaychef>[].obs;
  List<ItemConfiguracaoWaychef> get listaPlataformaContratoAdicionais => _listaPlataformaContratoAdicionais.toList();
  set listaPlataformaContratoAdicionais(value) => _listaPlataformaContratoAdicionais.value = value;


  Map<String, ItemConfiguracaoIntegradorWaychef> mapDetalhes = new Map();
  Map<ModuloContratoIndicadorEnum, List<ItemConfiguracaoWaychef>> mapContratoIndicador = new Map();
  Map<dynamic, dynamic> mapControleCheckBox = {}.obs;




  @override
  Future<void> onInit() async {
    // FUNCAO BUSCAR
    _buscarTodosItensPorIdEmpresaETipoItem();
    print("buscando NORMAL");
    _buscarTodosItemConfiguracaoWaychefExtra();

    //FUNCAO ATUALIZAR
    // atualizarItemConfiguracaoIntegrador();
    super.onInit();
  }



  final _boxEmpresateste = false.obs;
  get boxEmpresateste => _boxEmpresateste.value;
  void alternaBoxEmpresateste() {
    _boxEmpresateste.toggle();
  }

  void salvarAlteracoes() {
    Get.back();
  }


 // busca lista de itens extra da tela principal
  void _buscarTodosItensPorIdEmpresaETipoItem() async {
    print('cheguei no carregando');
    carregando = true;
    await PlataformaRequester.buscarTodosItensPorIdEmpresaETipoItem(Application.pwsConfigGateway, Application.tokenUsuario, "1" , "EXTRA").then((value) {
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

 // BUSCAR ADICIONAL DE EXTRAS
  void _buscarTodosItemConfiguracaoWaychefExtra() async {
    print('Busca os Adicionais');
    await PlataformaRequester.buscarTodosItemConfiguracaoWaychefExtra(Application.pwsConfigGateway, Application.tokenUsuario).then((value) {
      print('entrei no if de buscar buscarTodosItensPorIdEmpresaETipoItem');
      if (value.isSuccess) {
        _listaPlataformaContratoAdicionais.addAll(value.content);
        for (ItemConfiguracaoWaychef itemConfiguracaoWaychef in _listaPlataformaContratoAdicionais) {

          if(mapContratoIndicador[itemConfiguracaoWaychef.tipoItemContratoWaychef!.modulo] == null) {
            List<ItemConfiguracaoWaychef> listaa = [];
            listaa.add(itemConfiguracaoWaychef);
            mapContratoIndicador[itemConfiguracaoWaychef.tipoItemContratoWaychef!.modulo] = listaa;
          } else {
            mapContratoIndicador[
                    itemConfiguracaoWaychef.tipoItemContratoWaychef!.modulo]!
                .add(itemConfiguracaoWaychef);
          }
        }
        print(mapContratoIndicador);
      } else {
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar o modal adicionais');
      }
    });
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


    await PlataformaRequester.atualizarItemConfiguracaoIntegrador(Application.pwsConfigGateway, Application.tokenUsuario, listaPlataformaContratoDTO).then((value) {
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

class PlataformaIntegradorPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PlataformaIntegradorPageController());
  }
}
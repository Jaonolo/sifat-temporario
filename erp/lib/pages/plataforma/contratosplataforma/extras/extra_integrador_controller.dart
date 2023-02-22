import 'package:get/get.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/micro-service/contrato/plataforma/contrato-integrador/plataforma_contratos_extras_integrador_requester.dart';
import 'package:requester/requester/micro-service/contrato/plataforma/contrato-plataforma/plataforma_contratos_requester.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../widgets/utils/widgets_utils.dart';

class ExtraIntegradorPageController extends GetxController {


  //controlador do chebox -abaixo
  final _boxEmpresateste = false.obs;
  get boxEmpresateste => _boxEmpresateste.value;
  set boxEmpresateste(value) => _boxEmpresateste.value = value;

  void alternaBoxEmpresateste(int id, bool value) {
    listaPlataformaContratoIntegradorExtra[id].permiteComercializar = value;
    boxEmpresateste = listaPlataformaContratoIntegradorExtra[id].permiteComercializar;
    _boxEmpresateste.toggle();
    update();
  }


  final _carregando = false.obs;
  bool get carregando => _carregando.value;
  set carregando(value) => _carregando.value = value;


  var listaPlataformaContratoIntegradorExtra =
      <ItemConfiguracaoIntegradorWaychef>[].obs;
  RxMap<String, ItemConfiguracaoIntegradorWaychef> mapDetalhes =
      new Map<String, ItemConfiguracaoIntegradorWaychef>().obs;

  final _listaPlataformaContratoAdicionais = <ItemConfiguracaoWaychef>[].obs;
  List<ItemConfiguracaoWaychef> get listaPlataformaContratoAdicionais => _listaPlataformaContratoAdicionais.toList();
  set listaPlataformaContratoAdicionais(value) => _listaPlataformaContratoAdicionais.value = value;
  Map<ModuloContratoIndicadorEnum, List<ItemConfiguracaoWaychef>> mapContratoIndicador = new Map();

//------------FUNÇÕES -----------
  @override
  void onInit() {
    super.onInit();
    _buscarPlataformaContratoExtraIntegradores();
  }

  void _buscarPlataformaContratoExtraIntegradores() async {
    carregando = true;
    await PlataformaContratosExtrasIntegradorRequester
        .buscarTodosItensPorIdEmpresaETipoItem(Application.pwsConfigGateway,
        Application.tokenUsuario, "1", "EXTRA").then((value) {
      if (value.isSuccess) {
        listaPlataformaContratoIntegradorExtra.addAll(value.content);
        for (ItemConfiguracaoIntegradorWaychef value1
        in listaPlataformaContratoIntegradorExtra) {
          mapDetalhes[value1.itemConfiguracaoWaychefDTO.id!] = value1;
        }
      } else {
        //TODO: verificar e trata possiveis erros
        print('>>>>>> Erro ao carregar _buscarTodosItensPorIdEmpresaETipoItem');
      }
      print('>>>>>> mapDetalhes - FORA DO IF ');
      print(mapDetalhes);
    });
    print('>>>>>> mapDetalhes APOS FINALIZAR A FUNCAO ');
    print(mapDetalhes);

    carregando = false;
  }

  RxInt sortIndex = 99.obs;
  RxBool ascending = true.obs;

  // pronto ou funcional
  void onSort(int columnIndex) {
    var _listaOrdenada = listaPlataformaContratoIntegradorExtra;


    if (sortIndex.value == columnIndex)
      ascending.value = !ascending.value;
    else
      ascending.value = true;

    sortIndex.value = columnIndex;

    switch (columnIndex) {
      case 0:
        _listaOrdenada.sort((funcaoaplicacao, funcaoaplicacaob) =>
        ascending.value
            ? funcaoaplicacao
            .itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!
            .compareTo(funcaoaplicacaob
            .itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!)
            : funcaoaplicacaob
            .itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!
            .compareTo(funcaoaplicacao
            .itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!));
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 1:
        _listaOrdenada.sort((nomePrimeiro, nomeSegundo) => ascending.value
            ? nomePrimeiro.itemConfiguracaoWaychefDTO.nome!
            .compareTo(nomeSegundo.itemConfiguracaoWaychefDTO.nome!)
            : nomeSegundo.itemConfiguracaoWaychefDTO.nome!
            .compareTo(nomePrimeiro.itemConfiguracaoWaychefDTO.nome!));
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 2:
        _listaOrdenada.sort((nomePrimeiro, nomeSegundo) => ascending.value
            ? nomePrimeiro.detalhes!.compareTo(nomeSegundo.detalhes!)
            : nomeSegundo.detalhes!.compareTo(nomePrimeiro.detalhes!));
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      case 3:
        _listaOrdenada.sort((valorPrimeiro, valorSegundo) => ascending.value
            ? valorPrimeiro.valor!.compareTo(valorSegundo.valor!)
            : valorSegundo.valor!.compareTo(valorPrimeiro.valor!));
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;

      case 4:
        _listaOrdenada.sort((valorPrimeiro, valorSegundo) {
          return _compareString(
              ascending.value,
              valorPrimeiro.permiteComercializar!.toString(),
              valorSegundo.permiteComercializar!.toString());
        });
        listaPlataformaContratoIntegradorExtra = _listaOrdenada;
        break;
      default:
        break;
    }
  }

  final _alterarValor = false.obs;
  bool get alterarValor => _alterarValor.value;
  set alterarValor(value) => _alterarValor.value = value;

  int _compareString(bool ascending, String value1, String value2) {
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
      listaPlataformaContratoDTO.add(value);
    });
    await PlataformaContratosExtrasIntegradorRequester
        .atualizarItemConfiguracaoIntegrador(Application.pwsConfigGateway,
        Application.tokenUsuario, listaPlataformaContratoDTO)
        .then((value) {
      if (value.status == 200) {
        WidgetsUtils.snackBarSucesso('Sucesso', 'Lista atualizada');
      } else {
        WidgetsUtils.snackBarError('Erro', 'Falha ao salvar lista');
      }
    });
    carregando = false;
  }



// CONTROLLER DO BOTAO ADICIONAL
  void _buscarTodosItemConfiguracaoWaychefExtra() async {
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



}
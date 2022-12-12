// import 'package:erp/app/config/application.dart';
// import 'package:erp/app/utils/erro_utils.dart';
// import 'package:erp/app/utils/snack_bar_utils.dart';
// import 'package:mobx/mobx.dart';
// import 'package:models/model/models.dart';
// import 'package:requester/requester/micro-service/sessao/gerenciamento_sessoes_requester.dart';
// import 'package:requester/requester/micro-service/sessao/sessao_servico_requester.dart';
// import 'package:requester/requester/micro-service/sessao/sessao_usuario_requester.dart';
//
// part "sessao_controller.g.dart";
//
// class SessaoController = SessaoBase
//     with _$SessaoController;
//
// abstract class SessaoBase with Store {
//   @observable
//   bool carregando = true;
//
//   List<DadosSessaoDTO> dadosSessoes = [];
//
//   @action
//   Future<void> buscarSessoes() async {
//     await GerenciamentoSessoesRequester.buscarSessoes(
//         Application.pwsConfigGateway, Application.tokenUsuario)
//         .then((response) {
//       if (response.status == 200)
//         dadosSessoes = response.content;
//       else if(response.status == 204)
//         dadosSessoes = [];
//       else
//         throw PwsException(response.content);
//     }).catchError((e, s) {
//       ErroUtils.catchError(e, s);
//     });
//
//     carregando = false;
//   }
//
//   @action
//   Future<void> encerrarSessao(DadosSessaoDTO dto) async {
//     bool sucess = true;
//
//     if (dto.servico != null)
//     await SessaoServicoRequest.encerrarSessao(Application.pwsConfigGateway, dto.token!).catchError((e, s) {
//       sucess = false;
//       ErroUtils.catchError(e, s);
//     });
//     if (dto.nomeUsuario != null)
//     await SessaoUsuarioRequester.encerrarSessao(
//             Application.pwsConfigGateway, dto.token!)
//         .catchError((e, s) {
//       ErroUtils.catchError(e, s);
//       sucess = false;
//     });
//
//     if (sucess) {
//       SnackBarUtils.exibir("Sessao encerrada com sucesso!");
//       carregando = true;
//       buscarSessoes();
//     }
//   }
// }

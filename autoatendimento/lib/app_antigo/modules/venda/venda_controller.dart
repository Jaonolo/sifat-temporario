// import 'package:autoatendimento/app/app_controller.dart';
// import 'package:autoatendimento/app/modules/venda/repository/nota_item_repository.dart';
// import 'package:autoatendimento/app/modules/venda/repository/nota_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
// import 'package:models/model/models.dart';
// import 'package:requester/response/response_pws.dart';
// import 'package:utils/utils/consumo_utils.dart';
// import 'package:utils/utils/nota_utils.dart';
//
// import 'models/produto_carrinho.dart';
//
// part "venda_controller.g.dart";
//
// class VendaController = VendaBase with _$VendaController;
//
// abstract class VendaBase with Store {
//   AppController appController = Modular.get();
//
//   @observable
//   Nota nota = Nota();
//
//   @observable
//   String obsOndePrefereComer = "";
//
//   @observable
//   ObservableList<ProdutoCarrinho> itensLancados = ObservableList();
//
//   @action
//   void novaNota() {
//     nota = ConsumoUtils.instanciar(
//         appController.estacaoTrabalho);
//   }
//
//   @action
//   descartarNota() {
//     novaNota();
//     itensLancados.clear();
//   }
//
//   @action
//   Future<void> adicionarProdutoCarrinho(ProdutoCarrinho value) async {
//     if (value.index == null) {
//       value.index = itensLancados.length;
//       itensLancados.add(value);
//     }
//     atualizaTotais();
//   }
//
//   @action
//   void removerProdutoCarrinho(int index) {
//     //Remove o item pelo indice
//     itensLancados.removeAt(index);
//     //Refaz os indices da lista
//     for (int i = 0; i < itensLancados.length; i++) {
//       itensLancados[i].index = i;
//     }
//     atualizaTotais();
//   }
//
//   @action
//   void adcionarObservacao(String texto){
//     obsOndePrefereComer = texto;
//   }
//
//   void addNotaFinalizadora(FinalizadoraEmpresa finalizadoraEmpresa,
//       BigDecimal valor) {
//     NotaFinalizadora notaFinalizadora = NotaFinalizadora();
//     notaFinalizadora.idFinalizadora = finalizadoraEmpresa.id;
//     notaFinalizadora.valor = valor;
//     notaFinalizadora.idNota = nota.id;
//
//     nota.finalizadoras.add(notaFinalizadora);
//   }
//
//   void descartarNotaFinalizadoras() {
//     nota.finalizadoras.clear();
//   }
//
//   void atualizaTotais() {
//     nota = NotaUtils.atualizarTotais(nota, _listNotaItemLancados());
//   }
//
//   //Utils
//
//   void resumo() {
//     print('---[RESUMO]---');
//     print('NOTA - ValorTotal: ${nota.valorTotal}');
//   }
//
//   List<NotaItem> _listNotaItemLancados() {
//     //Converte a lista de produtoCarrinho para lista de notaItem
//     List<NotaItem> itens = [];
//     itensLancados.forEach((element) {
//       itens.add(element.notaItem);
//     });
//     return itens;
//   }
//
//   //Funções que comunicam com a API
//
//   Future<void> insereNotaAPI(BuildContext context) async {
//     novaNota();
//     nota = await NotaRepository.inserir(nota, context);
//   }
//
//   Future<void> insereItensAPI() async {
//     await NotaItemRepository.inserir(_listNotaItemLancados())
//         .catchError((e) => throw e);
//   }
//
//   Future<void> receberVendaAPI(BuildContext context) async {
//     nota =
//     await NotaRepository.receber(nota, context).catchError((e) => throw e);
//   }
//
//   Future<XmlDTO?> emitirFiscal() async {
//     return await NotaRepository.emitirFiscal(nota, "NFCE")
//         .catchError((e) => throw e);
//   }
//
//   Future<ResponsePws> atualizarErroPendencia(String erro) async {
//     return await NotaRepository.atualizarErroPendencia(nota, erro)
//         .catchError((e) => throw e);
//   }
// }

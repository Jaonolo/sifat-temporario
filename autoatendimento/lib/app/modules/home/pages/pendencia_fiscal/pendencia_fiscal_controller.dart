import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/pendencia_requester.dart';
import 'package:requester/requester/nota_requester.dart';

import '../../../venda/repository/nota_repository.dart';

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
  Future<List> carregaPendencias() async {
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
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao buscar Pendencias');
    });;
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

  void carregaNotaParaEmissao( Pendencia pendencia) async {
     return await NotaRequester.carregar(
         appController.pwsConfig, appController.token, pendencia.idEntidade!)
         .then((response) {
       if (response.status == 200) {
         Nota nota = response.content;
         resolvePendencia(nota, pendencia);
       } else {
         throw PwsException(response.content);
       }
     }).catchError((e, s) {
    if (e is WaybeException) throw e;
    throw WaybeException('Problema ao carregar nota para emissão');
    });;
  }

  Future<void> resolvePendencia(Nota nota, Pendencia pendencia) async {

    EstacaoTrabalho estacaoTrabalho = appController.estacaoTrabalho;
    //REMOVElISTA

    if(pendencia.tipoPendencia == "EMISSAO_NOTA" &&  nota.status == "CANCELADA"){
      return await NotaRequester.arquivarPendencia(
          appController.pwsConfig, appController.token, nota.id!,pendencia.tipoPendencia!)
          .then((response) {
        if (response.status == 200) {
          print('Pendencia arquivada com sucesso');
        } else {
          throw PwsException(response.content);
        }
      }).catchError((e, s) {
        if (e is WaybeException) throw e;
        throw WaybeException('Problema ao arquivar pendencia');
      });
    }

    if(nota.notaFiscal != null){

      if(nota.notaFiscal!.idEmissorFiscal == null ||
         (estacaoTrabalho.emissorFiscal != null &&
             nota.notaFiscal!.idEmissorFiscal == estacaoTrabalho.emissorFiscal!.id)){

        emitirFiscal(nota);
      }else {

        try {

        } catch (e) {
          print(e);
        }
      }

    }

  }


  Future<void> emitirFiscal(Nota nota) async {
    await NotaRepository.emitirFiscal(nota, "NFCE")
        .catchError((e) => throw e);
  }
}

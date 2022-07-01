import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_bloc.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_component.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/detalhes_cartao/list_tile_transacao.dart';

// ignore: must_be_immutable
class ListViewExtrato extends StatelessWidget {
  final WaycardFatura? fatura;
  final ClienteCartao cartao;
  List<WaycardTransacao> _extratos = [];

  ListViewExtrato({required this.cartao, this.fatura});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: fatura != null ? _listviewExtrato() : Container());
  }

  Widget _listviewExtrato() {
    return FutureBuilder(
      future: _carregarExtratos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          default:
            if (_extratos.isEmpty) return _txtNenhumaTransacao();

            return ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: _extratos.length,
              itemBuilder: (context, index) {
                var transacao = _extratos[index];
                return ListTileTransacao(transacao: transacao);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
        }
      },
    );
  }

  Future _carregarExtratos() async {
    await WaycardRequester.listarExtratoFaturas(AppConfig.application.pwsConfigWaychef,
        AppConfig.application.tokenUsuario, cartao.id!, fatura!.id!)
        .then((response) async {
      if (response.isSuccess) {
        if (response.hasContent) {
          _extratos = response.content;
          DetalhesCartaoPageComponent.extratos = _extratos;
          BlocProvider.getBloc<DetalhesCartaoPageBloc>().reloadTotalFatura();
        }
      } else if (response.status == 401) {
        await WaycardRequester.login(
            AppConfig.application.pwsConfigWaychef, AppConfig.application.user!)
            .then((response) async {
          if (response.isSuccess) {
            AppConfig.application.tokenUsuario = response.headers['token'];
            await _carregarExtratos();
          } else {
            throw PwsException(response.content);
          }
        }).catchError((error, s) {
          WayCardUtils.catchError(error, s);
        });
      } else {
        throw PwsException(response.content);
      }
    }).catchError((error, s) {
      WayCardUtils.catchError(error, s);
    });
  }

  Widget _txtNenhumaTransacao() {
    return Center(
      child: Text(
        "Nenhuma transação encontrada para esta fatura",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

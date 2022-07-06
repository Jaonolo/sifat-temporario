import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_bloc.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_component.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class DropdownFaturas extends StatelessWidget {
  final ClienteCartao cartao;
  List<WaycardFatura> _faturas = [];
  DetalhesCartaoPageBloc _bloc = BlocProvider.getBloc<DetalhesCartaoPageBloc>();

  DropdownFaturas({required this.cartao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: _carregarFaturas(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              return _dropFaturas();
          }
        },
      ),
    );
  }

  Future _carregarFaturas() async {
    await WaycardRequester.listarFaturas(AppConfig.application.pwsConfigWaychef,
        AppConfig.application.tokenUsuario, cartao.id!)
        .then((response) async {
      if (response.isSuccess) {
        if (response.hasContent) _faturas = response.content;
      } else if (response.status == 401) {
        WayCardUtils.closeProgress();
        await WaycardRequester.login(
            AppConfig.application.pwsConfigWaychef, AppConfig.application.user!)
            .then((response) async {
          if (response.isSuccess) {
            AppConfig.application.tokenUsuario = response.headers['token'];
            return await _carregarFaturas();
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

    DetalhesCartaoPageComponent.fatura =
        _faturas.firstWhereOrNull((f) => f.status == "ABERTA");
    _bloc.reloadFatura();
  }

  Widget _dropFaturas() {
    var items = _faturas
        .map((f) =>
        DropdownMenuItem(
          value: f,
          child: Text(
              "${f.status} ${f.status != 'ABERTA' ? "- ${DateTimeUtils.format(
                  f.dataFechamento, DateTimeUtils.dataFormat)}" : ""}"),
        ))
        .toList();

    return StreamBuilder(
        stream: _bloc.reloadFaturaStream,
        builder: (context, snapshot) {
          return DropdownButtonFormField(
            items: items,
            isExpanded: true,
            value: DetalhesCartaoPageComponent.fatura,
            decoration: InputDecoration(labelText: "Faturas"),
            onChanged: (value) {
              if (value != null) {
                DetalhesCartaoPageComponent.fatura = value as WaycardFatura?;
                _bloc.reloadFatura();
              }
            },
          );
        });
  }
}

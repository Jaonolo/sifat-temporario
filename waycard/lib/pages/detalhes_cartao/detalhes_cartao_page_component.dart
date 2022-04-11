import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_bloc.dart';
import 'package:waycard/widgets/detalhes_cartao/card_detalhes_cartao.dart';
import 'package:waycard/widgets/detalhes_cartao/dropdown_faturas.dart';
import 'package:waycard/widgets/detalhes_cartao/list_view_extrato.dart';

class DetalhesCartaoPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

  late ClienteCartao _cartao;
  static WaycardFatura? fatura;
  DetalhesCartaoPageBloc _bloc = BlocProvider.getBloc<DetalhesCartaoPageBloc>();
  static List<WaycardTransacao> extratos = [];

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detalhes Carteira",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            "${_cartao.bandeira!.descricao} (${_cartao.numero})",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  Widget body() {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: _title(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _detalhesCartao(),
            ]),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                _dropdownFaturas(),
                _extrato(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detalhesCartao() {
    return CardDetalhesCartao(
      cartao: _cartao,
    );
  }

  Widget _dropdownFaturas() {
    return DropdownFaturas(
      cartao: _cartao,
    );
  }

  Widget bottomBarValorFatura() {
    return StreamBuilder(
        stream: _bloc.reloadTotalFaturaStream,
        builder: (context, snapshot) {
          var valorFatura = BigDecimal.ZERO();
          if (extratos.length > 0)
            valorFatura = extratos.map((ex) {
              if (ex.status == 'EFETUADA')
                return ex.valor!;
              else
                return BigDecimal.ZERO();
            }).reduce((total, valor) => total + valor);

          return BottomAppBar(
            color: AppConfig.theme.colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Valor da fatura",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "R\$ ${valorFatura.toStringAsFixed(2)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _extrato() {
    return Expanded(
      child: StreamBuilder(
          stream: _bloc.reloadFaturaStream,
          builder: (context, snapshot) {
            return ListViewExtrato(
              cartao: _cartao,
              fatura: fatura,
            );
          }),
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------

  void initialize(
      {required BuildContext context, required ClienteCartao cartao}) {
    fatura = null;
    _cartao = cartao;
  }
}

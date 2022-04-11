import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

import '../botao_primario.dart';

class CardCardapioDescricao extends StatefulWidget {
  CardCardapioDescricao({Key? key}) : super(key: key);

  @override
  _CardCardapioDescricaoState createState() => _CardCardapioDescricaoState();
}

class _CardCardapioDescricaoState extends State<CardCardapioDescricao> {
  @override
  late BuildContext context;
  late double _heightScreen;
  late double _widthScreen;

  final double _fontGigante = 32;
  final double _fontGrande = 26;
  final double _fontMedia = 20;
  final double _fontPequena = 16;

  initialize(BuildContext context) {
    this.context = context;
    _heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    _widthScreen = MediaQuery
        .of(context)
        .size
        .width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              _Adicioanais(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _Adicioanais() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            SizedBox(
              width: _widthScreen * 0.75,
              height: _heightScreen * 0.04,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'X-TUDO',
                        style: TextStyle(fontSize: _fontGigante),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: _heightScreen * 0.48,
              width: _widthScreen * 0.75,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView(
                      children: [
                        Image.network(
                          'https://img.freepik.com/fotos-gratis/delicioso-hamburguer-suculento-com-tomate-ervas-queijo-e-carne-isolado-em-um-fundo-branco-hamburguer-saboroso-isolado-no-branco-com-gergelim_165217-130.jpg?size=626&ext=jpg',
                          width: 200,
                        ),
                        Wrap(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '1 hambúrguer, 50 g de bacon picados, 1 ovo, 2 fatias de presunto, 2 fatias de mussarela, 1 folha de alface, 1 rodela de tomate',
                                style: TextStyle(fontSize: _fontMedia)),
                          ),
                        ]),
                        Center(
                            child: Text(
                              'OPCIONAIS:',
                              style: TextStyle(fontSize: _fontGrande),
                            )),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                        _listaDeAdicionais(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  )
                ],
              ),
            ),
            SizedBox(
                width: _widthScreen * 0.75,
                height: _heightScreen * 0.05,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'TOTAL',
                                  style: TextStyle(fontSize: _fontPequena),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' R\$ 22.50',
                                  style: TextStyle(fontSize: _fontGigante),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: BotaoPrimario(
                          descricao: 'adicionar ao carrinho',
                          function: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _listaDeAdicionais() {
    bool _value = true;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: DefaultTheme.accentColor)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Checkbox(
                      value: _value,
                      onChanged: (bool? newValue) {},
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  '+ 2 HAMBURGUER',
                  style: TextStyle(fontSize: _fontMedia),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'R\$ 2.50',
                        style: TextStyle(fontSize: _fontMedia),
                      )))
            ]),
          )),
    );
  }
}

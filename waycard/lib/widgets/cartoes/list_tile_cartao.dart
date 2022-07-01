import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:waycard/config/app_config.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/cartoes/token_dialog.dart';

class ListTileCartao extends StatelessWidget {
  final ClienteCartao cartao;

  const ListTileCartao({required this.cartao});

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery
        .of(context)
        .size;

    var _percent = (cartao.limite!.subtrair(cartao.saldo)).dividir(
        cartao.limite!).toDouble();


    // ((cartao.limite! - (cartao.saldo)) / cartao.limite!).toDouble();
    if (_percent < 0) _percent = 0;
    if (_percent > 1) _percent = 1;

    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: appSize, baseValue: 16)),
      child: Card(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            onTap: () => _onTap(context),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    colors: [
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.10),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.15),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.20),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.25),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.30),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.35),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.40),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.45),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.50),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.55),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.60),
                      AppConfig.theme.colorScheme.secondary.withOpacity(0.65),
                    ],
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      cartao.bandeira!.descricao!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveUtils.responsiveSize(
                            appSize: appSize, baseValue: 18),
                      ),
                    ),
                    subtitle: Text(
                      cartao.bandeira!.empresa!.pessoa!.nome!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveUtils.responsiveSize(
                              appSize: appSize, baseValue: 18)),
                    ),
                    trailing: Text(
                      "STATUS ${cartao.status}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveUtils.responsiveSize(
                            appSize: appSize, baseValue: 18),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      cartao.numero!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: ResponsiveUtils.responsiveSize(
                              appSize: appSize, baseValue: 4),
                          fontSize: ResponsiveUtils.responsiveSize(
                              appSize: appSize, baseValue: 18),
                          fontFamily: ""),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                      ),
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.touch_app,
                          color: Colors.yellow,
                          size: ResponsiveUtils.responsiveSize(
                              appSize: appSize, baseValue: 30),
                        ),
                        onPressed: () => _onGerarToken(context),
                        label: Text(
                          "Gerar Token",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveUtils.responsiveSize(
                                appSize: appSize, baseValue: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ResponsiveUtils.responsiveSize(
                            appSize: appSize, baseValue: 16)),
                    child: Text(
                      "Validade ${DateTimeUtils.format(
                          cartao.validade, DateTimeUtils.dataFormat)}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveUtils.responsiveSize(
                            appSize: appSize, baseValue: 18),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppConfig.application.user!.nome!.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveUtils.responsiveSize(
                              appSize: appSize, baseValue: 18)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      ResponsiveUtils.responsiveSize(
                          appSize: appSize, baseValue: 16),
                      0,
                      ResponsiveUtils.responsiveSize(
                          appSize: appSize, baseValue: 16),
                      0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            "Utilizado R\$ ${(cartao.limite! - (cartao.saldo))
                                .toStringAsFixed(2)}"),
                        Text("Diponivel R\$ ${(cartao.saldo!).toStringAsFixed(
                            2)}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 5,
                      animateFromLastPercent: true,
                      backgroundColor: AppConfig.theme.primaryColor,
                      progressColor: AppConfig.theme.primaryColorLight,
                      percent: _percent,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _onTap(BuildContext context) {
    WaycardRequester.listarCartoes(
        AppConfig.application.pwsConfigWaychef, AppConfig.application.tokenUsuario)
        .then((response) async {
      if (response.status == 401) {
        await WaycardRequester.login(
            AppConfig.application.pwsConfigWaychef, AppConfig.application.user!)
            .then((response) async {
          if (response.isSuccess) {
            AppConfig.application.tokenUsuario = response.headers['token'];
          } else {
            throw PwsException(response.content);
          }
        });
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetalhesCartaoPage(
                    cartao: cartao,
                  )));
    });
  }

  void _onGerarToken(BuildContext ctx) {
    WayCardUtils.showProgress();
    WaycardRequester.gerarToken(AppConfig.application.pwsConfigWaychef,
        AppConfig.application.tokenUsuario, cartao.id!)
        .then((response) {
      if (response.isSuccess) {
        WayCardUtils.closeProgress();
        var token = response.headers["token"];
        showDialog(
            context: ctx,
            builder: (context) =>
                TokenDialog(
                  token,
                ));
      } else if (response.status == 401) {
        WayCardUtils.closeProgress();
        WaycardRequester.login(
            AppConfig.application.pwsConfigWaychef, AppConfig.application.user!)
            .then((response) async {
          if (response.isSuccess) {
            AppConfig.application.tokenUsuario = response.headers['token'];
            _onGerarToken(ctx);
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
      WayCardUtils.catchError(error, s, closeable: true);
    });
  }
}

import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/dao/dao.dart';
import 'package:autopesagem/pages/home/home.dart';
import 'package:autopesagem/pages/splash/splash_controller.dart';
import 'package:autopesagem/widgets/configuracao/dialog_config_app.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils/funcoes.dart';

class SplashPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  late BuildContext _context;
  SplashController controller = SplashController();

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget body() {
    return Container(
      color: Color.fromRGBO(43, 49, 53, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/waychef_inicio.png",
            height: 200,
            width: 200,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              )),
        ],
      ),
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------

  Future initialize({required BuildContext context}) async {
    _context = context;

    await GetValue.getValuesFuncao();

    AppConfig.nomeEstacao = (await Funcoes.getDeviceIdentification())!;

    Function onSucess = () =>
        Navigator.pushReplacement(
            _context, MaterialPageRoute(builder: (context) => Home()));

    Function(String msg) onError = (msg) {
      WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
          await showDialog(
              context: context,
              builder: (context) =>
                  DialogConfigApp(
                    mensagemErro: msg,
                  ));
        },
      );
    };

    controller.verificaDadosConexao(onSucess, onError);
  }
}

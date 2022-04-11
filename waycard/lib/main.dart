import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/client.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/atulizar_senha/atualizar_senha_bloc.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page_bloc.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_bloc.dart';
import 'package:waycard/pages/home/home_page_bloc.dart';
import 'package:waycard/pages/login/login_page.dart';
import 'package:waycard/pages/login/login_page_bloc.dart';
import 'package:waycard/pages/sobre/sobre_page_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => HomePageBloc()),
        Bloc((i) => SobrePageBloc()),
        Bloc((i) => LoginPageBloc()),
        Bloc((i) => AtualizarSenhaBloc()),
        Bloc((i) => CriarContaPageBloc()),
        Bloc((i) => DetalhesCartaoPageBloc()),
      ],
      dependencies: [],
      child: MaterialApp(
        title: AppConfig.application.client!.descricao,
        theme: AppConfig.theme,
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

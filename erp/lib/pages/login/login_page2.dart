import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/responsive.dart';
import '../../widgets/utils/dialog_confirmacao.dart';
import 'login_page_controller.dart';

class LoginPage2 extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

    Size _size = MediaQuery.of(context).size;

//------------------------------------------------ EstruturaPrincipal -----------------------------------------------------

    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 36, 38, 1),
      body: Responsive(
        mobile: _telaLogin(context),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width <= 1340 ? 3 : 5,
              child: _foodImages(),
            ),
            Expanded(
              flex: 2,
              child: _telaLogin(context),
            )
          ],
        ),
      ),
    );
  }

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget _telaLogin(context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          _logo(),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          _textoBemVindo(),
          _textoDadosParaLogin(),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          _inputUsuario(),
          _inputSenha(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckBoxMobile(

                  ),
                  Text(
                    'Lembrar usuário',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 15,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 40,),
          Spacer(),
          _btnLogin(),
          // const SizedBox(height: 8,),
          _btnTextEsqueceuSenha(),
          Spacer(),
          // Expanded(child: Container()),
          _logoRodape(context),

        ],
      ),
    );
  }

  Widget _espacoSpacer(){
    return Spacer();
  }

  Widget _btnLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(35, 161, 232, 1),
        padding: const EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 16.0,
        ),
        textStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        controller.validaLogin();
      },
      child: Text(
        "Entrar",
        style: GoogleFonts.sourceSansPro(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  Widget _btnTextEsqueceuSenha() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Get.dialog(
              DialogoConfirmacao(
                titulo: "Recuperar Senha",
                mensagem:
                    "Informe seu e-mail e enviaremos instruções de como resetar a senha.",
                corpo: _inputRecuperaEmail(),
                onConfirm: controller.enviaEmailRecuperacao,
                txtConfirmar: 'Enviar',
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Esqueceu sua senha?',
              style: GoogleFonts.sourceSansPro(
                color: Color.fromRGBO(35, 161, 232, 1),
                decoration: TextDecoration.underline,
                fontSize: 16,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputSenha() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Color.fromRGBO(62, 66, 70, 1),
          ),
          child: TextFormField(
            cursorColor: Color.fromRGBO(255, 255, 255, 1),
            keyboardType: TextInputType.emailAddress,
            obscureText: !controller.exibirSenha,
            style: const TextStyle(
              fontSize: 20.0,
            ),
            decoration: InputDecoration(
              labelStyle: GoogleFonts.sourceSansPro(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              contentPadding: EdgeInsets.all(24.0),
              labelText: 'Senha',
              suffixIcon: IconButton(
                icon: Icon(controller.exibirSenha
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Color.fromRGBO(255, 255, 255, 1),
                onPressed: () => controller.alterarExibirSenha(),
              ),
            ),
            controller: controller.senhaController,
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              } else {
                return "Insira uma senha válida";
              }
            },
            onFieldSubmitted: (_) => {controller.validaLogin()},
          ),
        ),
      ),
    );
  }

  Widget _foodImages() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/logo_waychef.webp"),
        ),
      ),
    );
  }

  Widget _textoBemVindo() {
    return Text(
      'Bem vindo ao Waybe ERP!',
      textAlign: TextAlign.center,
      style: GoogleFonts.comfortaa(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.w500,
        fontSize: 23,
        letterSpacing: -0.5,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget _textoDadosParaLogin() {
    return Text(
      'Por favor, insira seus dados para efetuar o login.',
      textAlign: TextAlign.center,
      style: GoogleFonts.sourceSansPro(
        color: Color.fromRGBO(252, 252, 255, 1),
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: 0.25,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget _inputUsuario() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
            borderRadius:BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            ),
          color: Color.fromRGBO(62, 66, 70, 1),
        ),
        child: TextFormField(

          cursorColor: Color.fromRGBO(255, 255, 255, 1),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
            labelStyle: GoogleFonts.sourceSansPro(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 15,
              letterSpacing: 0.25,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            contentPadding: EdgeInsets.all(24.0),
            focusColor: Color.fromRGBO(255, 255, 255, 1),
            hintStyle: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            labelText: "E-mail",
          ),
          controller: controller.usuarioController,
          validator: (value) {
            if (GetUtils.isEmail(value!)) {
              return null;
            } else {
              return "Insira um e-mail válido";
            }
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  Widget _inputRecuperaEmail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(12.0),
          // ),
          labelText: "E-mail para contato",
        ),
        controller: controller.recuperaEmailController,
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: const Image(
        image: AssetImage("assets/images/waybe.png"),
      ),
      // margin: const EdgeInsets.fromLTRB(70.0, 30, 70.0, 30.0),
    );
  }

  Widget _logoRodape(context) {
    var altura = MediaQuery.of(context).size.height;
    var lagura = MediaQuery.of(context).size.width;
    print('---------');
    print(altura);
    print(lagura);
    print('---------');
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 70, 1),
      ),
      child: Center(
        child: Image(
          // width: Get.width / 6,
          image: AssetImage("assets/images/bysifat.png"),
        ),
      ),
    );
  }
}

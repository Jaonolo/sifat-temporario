import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_shifter_v2/mask_shifter.dart';
import 'package:utils/utils/masks.dart';
import 'package:utils/utils/string_utils.dart';

import 'wizard_controller.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({Key? key}) : super(key: key);

  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  WizardController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: StyleUtils.fundoTransparencia(),
        ),
        child: Column(
          children: [
            const Expanded(flex: 15, child: AppBarImage()),
            Expanded(flex: 85, child: _formulario()),
          ],
        ));
  }

  Widget _formulario() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: [
            _txtCNPJ(),
            _txtUrlApi(),
            _txtClientSecret(),
            const SizedBox(height: 100),
            _btnGravar(),
          ],
        ),
      ),
    );
  }

  Widget _txtCNPJ() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: true,
        controller: controller.controllerCNPJ,
        keyboardType: TextInputType.number,
        inputFormatters: [
          MaskedTextInputFormatterShifter(
            maskONE: Masks.cpf(),
            maskTWO: Masks.cnpj(),
          ),
        ],
        decoration: InputDecoration(
          labelText: "CNPJ",
          labelStyle: TextStyle(color: DefaultTheme.cinza),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DefaultTheme.cinza),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Informe seu CNPJ";

          if (CPFValidator.isValid(value) || CNPJValidator.isValid(value)) {
            return null;
          }

          value = StringUtils.removeMascaraInscricaoFederal(value);

          if (value.length <= 11 && !CPFValidator.isValid(value, true)) {
            return "Informe um CPF válido";
          }

          if (value.length <= 14 && !CNPJValidator.isValid(value, true)) {
            return "Informe um CNPJ válido";
          }

          return null;
        },
      ),
    );
  }

  Widget _txtUrlApi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: true,
        controller: controller.controllerUrlApi,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "URL API",
          labelStyle: TextStyle(color: DefaultTheme.cinza),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DefaultTheme.cinza),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Informe a URL da API";
          return null;
        },
      ),
    );
  }

  Widget _txtClientSecret() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller.controllerClientSecret,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Client Secret",
          labelStyle: TextStyle(color: DefaultTheme.cinza),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DefaultTheme.cinza),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Informe o ClientSecret";
          return null;
        },
      ),
    );
  }

  Widget _btnGravar() {
    return BotaoPrimario(descricao: 'GRAVAR', function: () {
      if (formKey.currentState!.validate()) {
        controller.gravar(context);
      }
    });
  }
}

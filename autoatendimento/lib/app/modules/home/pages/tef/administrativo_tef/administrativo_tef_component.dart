import 'package:autoatendimento/app/modules/home/pages/tef/administrativo_tef/administrativo_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdministrativoTefComponent {
  AdministrativoTefController controller = Modular.get();

  Widget body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          Expanded(flex: 15, child: const AppBarImage()),
          Expanded(
            flex: 85,
            child: opcoes(),
          )
        ],
      ),
    );
  }

  Widget opcoes() {
    return Row(
      children: [
        InkWell(
          child: TextButton(
            child: Text("Cancelamento TEF"),
            onPressed: () => controller.cancelamentoTef(),
          ),
        ),
        InkWell(
          child: TextButton(
            child: Text("Reimpressão TEF"),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}

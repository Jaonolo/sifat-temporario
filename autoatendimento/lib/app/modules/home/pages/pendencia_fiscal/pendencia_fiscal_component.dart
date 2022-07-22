import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PendenciaFiscalComponent {
  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

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
            child: TextButton(onPressed: (){}, child:Text("Reemitir")),
          )
        ],
      ),
    );
  }
}

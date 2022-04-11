import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoBotaoWidget extends StatefulWidget {
  const CarrinhoBotaoWidget({Key? key}) : super(key: key);

  @override
  _CarrinhoBotaoWidgetState createState() => _CarrinhoBotaoWidgetState();
}

class _CarrinhoBotaoWidgetState extends State<CarrinhoBotaoWidget> {
  final VendaController vendaController = Modular.get();
  final HomeController homeController = Modular.get();
  bool icon = true;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        homeController.onMostrarCarrinho();
        setState(() {
          icon = !icon;
        });
      },
      label: Observer(builder: (_) {
        return Text('${vendaController.itensLancados.length}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold));
      }),
      icon: icon == true
          ? const Icon(
        Icons.shopping_cart_outlined,
      )
          : const Icon(
        Icons.shopping_cart_sharp,
      ),
    );
  }
}

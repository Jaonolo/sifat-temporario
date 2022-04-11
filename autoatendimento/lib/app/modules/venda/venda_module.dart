import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VendaModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind((i) => VendaController()),
      ];

  List<ModularRoute> get routers => [];
}

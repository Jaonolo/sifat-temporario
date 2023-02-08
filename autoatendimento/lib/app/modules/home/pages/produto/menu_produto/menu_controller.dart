import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

part "menu_controller.g.dart";


class MenuController = MenuControllerBase with _$MenuController;

abstract class MenuControllerBase with Store {

  CardapioMenu cardapioMenu = new CardapioMenu();

  confirmarMenu(CardapioMenu menu) {
    this.cardapioMenu = menu;
    Modular.to.pushNamed("/produto");
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'menu_component.dart';
import 'menu_controller.dart';


class MenuPage extends StatelessWidget with MenuComponent {
  MenuPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    initialize(context);
    return body();
  }
}

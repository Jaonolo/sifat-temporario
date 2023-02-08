import 'package:flutter/material.dart';
import 'menu_component.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with MenuComponent{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return body();
  }
}

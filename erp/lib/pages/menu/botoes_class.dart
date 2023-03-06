import 'package:flutter/material.dart';

class Botoes implements _botoes {
  Botoes({this.icon, required this.text, this.items = const <MenuEntries>[]});

  final IconData? icon;
  final String text;
  final List<MenuEntries> items;
}

class MenuEntries implements _menuEntries {
  MenuEntries({required this.text, required this.onClick});

  final String text;
  final Function() onClick;
}

abstract class _botoes {
  IconData? get icon;
  String get text;
  List<_menuEntries> get items;
}

abstract class _menuEntries {
  String get text;
  Function() get onClick;
}

import 'package:flutter/material.dart';

class RowCustom<T> {
  Widget child;
  T object;
  bool selected = false;

  RowCustom({
    required this.child,
    required this.object,
  });

}
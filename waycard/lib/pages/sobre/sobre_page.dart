import 'package:flutter/material.dart';
import 'package:waycard/pages/sobre/sobre_page_component.dart';


class SobrePage extends StatelessWidget with SobrePageComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}

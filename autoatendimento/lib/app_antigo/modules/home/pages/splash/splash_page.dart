// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// import 'splash_component.dart';
// import 'splash_controller.dart';
//
// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);
//
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> with SplashComponent {
//   @override
//   SplashController controller = Modular.get();
//
//   @override
//   void initState() {
//     controller.verificaSeTaConfigurado(context);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext c) {
//     return Scaffold(
//       body: body(c),
//     );
//   }
// }

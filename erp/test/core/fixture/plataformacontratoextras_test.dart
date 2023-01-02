// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
//
// import 'package:erp/main.dart';
//
// void main() {
//   testWidgets('Teste de requisição HTTP para obter o arquivo JSON', (WidgetTester tester) async {
//     // Faça a requisição HTTP e obtenha a resposta
//     http.Response response = await http.get('http://localhost:8081/contrato/waychef/item-integrador/buscar-todos/1/por-tipo/EXTRA');
//
//     // Verifique se a resposta foi bem-sucedida (código de status HTTP 200)
//     expect(response.statusCode, 200);
//
//     // Deserialize o conteúdo da resposta para um Map
//     Map<String, dynamic> jsonMap = jsonDecode(response.body);
//
//     // Verifique se o Map contém as chaves e valores esperados
//     expect(jsonMap.containsKey('valor'), true);
//     expect(jsonMap['valor'], '10');
//
//   });
// }

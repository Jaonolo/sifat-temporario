import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> snackbarGlobalKey = GlobalKey<ScaffoldMessengerState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String>? queryParams}) {
    if (queryParams != null)
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();

    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(){
    navigatorKey.currentState!.pop();
  }
}
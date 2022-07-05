import 'package:auto_route/auto_route.dart';
import 'package:erp/app/pages/sessao/sessao_page.dart';
import 'package:erp/app/pages/splash/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SessaoPage),
  ],
)
class $AppRouter {}
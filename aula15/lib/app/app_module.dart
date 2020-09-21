import 'package:aula15/app/modules/login/login_module.dart';
import 'package:aula15/app/modules/splash/splash_controller.dart';
import 'package:aula15/app/app_controller.dart';
import 'package:aula15/app/modules/splash/splash_page.dart';
import 'package:aula15/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:aula15/app/app_widget.dart';
import 'package:aula15/app/modules/home/home_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthStore()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_,__) => SplashPage()),
        Router('/home',module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

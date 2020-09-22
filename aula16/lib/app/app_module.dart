import 'package:aula16/app/modules/login/login_module.dart';
import 'package:aula16/app/modules/splash/splash_controller.dart';
import 'package:aula16/app/app_controller.dart';
import 'package:aula16/app/modules/splash/splash_page.dart';
import 'package:aula16/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:aula16/app/app_widget.dart';
import 'package:aula16/app/modules/home/home_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthStore()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_,__) => SplashPage()),
        ModularRouter('/home',module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

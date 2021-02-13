import 'dart:ui';

import 'package:aula22/modules/login/login_controller.dart';
import 'package:aula22/modules/login/utils/login_validators.dart';
import 'package:flutter/material.dart';

import 'widgets/flat_button_expanded_widget.dart';
import 'widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: size.width,
                  height: size.height * 0.45,
                  child: Image.asset(
                    "assets/images/background_login.png",
                    fit: BoxFit.fitWidth,
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bem vindo!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Matenha seus gastos em dia!",
                        style: TextStyle(
                            color: Color(0xFF8F92A1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      InputTextWidget(
                          label: "EMAIL",
                          type: InputTextType.email,
                          onChange: (email) =>
                              controller.onChangeAndValidate(email: email),
                          onValidate: LoginValidators.email),
                      SizedBox(
                        height: 18,
                      ),
                      InputTextWidget(
                          label: "PASSWORD",
                          type: InputTextType.password,
                          onChange: (password) => controller
                              .onChangeAndValidate(password: password),
                          onValidate: LoginValidators.passsword),
                      SizedBox(
                        height: 18,
                      ),
                      ValueListenableBuilder(
                        valueListenable: controller.enabledButtonNotifer,
                        builder: (_, enabled, __) => enabled
                            ? FlatButtonExpandedWidget(
                                label: "Login",
                                onTap: () {},
                              )
                            : Container(),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      FlatButtonExpandedWidget(
                        type: FlatButtonExpandedType.none,
                        label: "Esqueci minha senha",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      FlatButtonExpandedWidget(
                        type: FlatButtonExpandedType.outline,
                        label: "Cria uma conta",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

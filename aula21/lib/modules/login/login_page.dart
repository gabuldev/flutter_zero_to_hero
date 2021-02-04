import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/flat_button_expanded_widget.dart';
import 'widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        onValidate: (value) =>
                            value.contains("@") ? null : "Email invalido",
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      InputTextWidget(
                        label: "PASSWORD",
                        type: InputTextType.password,
                        onValidate: (value) => value.length >= 6
                            ? null
                            : "A senha deve ter no mínimo 6 caracteres",
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      FlatButtonExpandedWidget(
                        label: "Login",
                        onTap: () {},
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

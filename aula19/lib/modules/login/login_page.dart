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
          Container(
            width: size.width,
            height: size.height,
            color: Colors.green,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.8,
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
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Matenha seus gastos em dia!"),
                      SizedBox(
                        height: 40,
                      ),
                      InputTextWidget(
                        label: "EMAIL",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InputTextWidget(label: "PASSWORD"),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButtonExpandedWidget(
                        label: "ENTRAR",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButtonExpandedWidget(
                        type: FlatButtonExpandedType.none,
                        label: "Esqueci minha senha",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButtonExpandedWidget(
                        type: FlatButtonExpandedType.outline,
                        label: "CRIAR UMA CONTA",
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

import 'package:aula16/app/modules/login/widgets/form_login/form_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormLoginWidget extends StatefulWidget {
  final Function(String email, String password) onPressed;

  const FormLoginWidget({Key key, this.onPressed}) : super(key: key);
  @override
  _FormLoginWidgetState createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends ModularState<FormLoginWidget, FormLoginController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Observer(builder: (_) => TextField(
              onChanged: controller.saveEmail,
              decoration: InputDecoration(
                hintText: "Email",
                errorText: controller.validateEmail
              ),
            ),),
            Observer(builder: (_) => TextField(
              onChanged: controller.savePassword,
              decoration: InputDecoration(
                hintText: "Password",
                errorText: controller.validatePassword
              ),
            ),),
            SizedBox(
              height: 16
            ),
            Observer(builder: (_) => RaisedButton(
              child: Text("Entrar"),
              onPressed: controller.validate ? (){
                widget.onPressed(controller.email,controller.password);
              } : null
              )),
    ],);
  }
}

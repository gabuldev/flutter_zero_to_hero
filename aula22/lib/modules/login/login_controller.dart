import 'package:aula22/modules/login/utils/login_validators.dart';
import 'package:flutter/material.dart';

class LoginController {
  final enabledButtonNotifer = ValueNotifier<bool>(false);
  bool get enabledButton => enabledButtonNotifer.value;
  set enabledButton(bool value) => enabledButtonNotifer.value = value;

  String _email;
  String _password;
  void onChangeAndValidate({String email, String password}) {
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (LoginValidators.email(_email) == null &&
        LoginValidators.passsword(_password) == null) {
      enabledButton = true;
    } else {
      enabledButton = false;
    }
  }
}

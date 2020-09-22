import 'package:mobx/mobx.dart';

part 'form_login_controller.g.dart';

class FormLoginController = _FormLoginControllerBase with _$FormLoginController;

abstract class _FormLoginControllerBase with Store {
   @observable
  String email = "";

  @observable
  String password = "";


  @action
  void saveEmail(String value) => email = value;

  @action
  void savePassword(String value) => password = value;

  @computed
  String get validateEmail => email.length == 0 || email.contains("@") ? null : "Email invalido";

  @computed
  String get validatePassword => password.length == 0 || password.length >=6 ? null : "Senha deve conter no minimo 6 caracteres";
  @computed
  bool get validate => validatePassword == null && password.isNotEmpty  && validateEmail == null && email.isNotEmpty;
}

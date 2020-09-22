
import 'package:aula16/shared/auth/auth_store.dart';
import 'package:aula16/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';

import 'login_state.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
 final AuthStore authStore;
  @observable
  LoginState state = None();

  _LoginControllerBase(this.authStore);

  @action 
  Future<void> login({String email, String password}) async{
    state = Loading();
    await Future.delayed(Duration(seconds: 1));
    if(email == 'email@email.com' && password == '123456'){

    state = Success();
    authStore.logged(UserModel());
    }else{
      state = Error();
    }
  }


}

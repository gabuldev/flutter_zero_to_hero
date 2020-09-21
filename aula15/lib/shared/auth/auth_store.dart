
import 'package:aula15/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase extends Disposable with Store {
  @observable
  UserModel _user;

  ReactionDisposer _disposer;

  _AuthStoreBase(){
  _disposer = autorun((_){
      if(_user != null){
        Modular.to.pushReplacementNamed('/home');
      }else{
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }
  
  @action
  void logged(UserModel user){
    _user = user;
  }
 
  @action
  void logout(){
    _user = null;
  }

 UserModel get currentUser => _user;

 @override
  void dispose() {
   _disposer();
  }
}
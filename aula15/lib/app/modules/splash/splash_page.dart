import 'package:aula15/shared/auth/auth_store.dart';
import 'package:aula15/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:1)).then((_) =>
   Modular.get<AuthStore>().logged(UserModel()));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

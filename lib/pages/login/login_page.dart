import 'package:flutter/material.dart';
import 'package:projetos/pages/login/widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 150,
          child: Image.network("https://img.icons8.com/color/452/flutter.png"),
        ),

        //Logo
        //Form
        LoginFormWidget(),
      ],
    ));
  }
}

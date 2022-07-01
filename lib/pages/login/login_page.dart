import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/pages/home/home_page.dart';
import 'package:projeto_pet_adoption_app/pages/login/widgets/login-page-widget.dart';
import 'package:projeto_pet_adoption_app/services/prefs-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _init(),
    );

    super.initState();
  }

  void _init() async {
    verificaUsuarioLogado();
  }

  void verificaUsuarioLogado() {
    Future.wait(
      [
        PrefsService.isAuth(),
      ],
    ).then((value) async => value[0]
        ? await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const HomePage();
              },
            ),
          )
        : null);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[LoginPageWidget()],
        ),
      ),
    );
  }
}

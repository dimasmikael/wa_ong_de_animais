import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/base.service.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/controllers/login-controller.dart';
import 'package:projeto_pet_adoption_app/pages/home/home_page.dart';
import 'package:projeto_pet_adoption_app/services/prefs-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

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
        Future.delayed(
          const Duration(milliseconds: 1),
        ),
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
          children: <Widget>[
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 20,
              width: SizeConfig.safeBlockHorizontal! * 20,
              child: Image.asset("assets/imagens/dogs-ani.jpg"),
            ),
            const SizedBox(height: 40.0),
            TextField(
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                  color: Colors.black),
              keyboardType: TextInputType.number,
              onChanged: _controller.setLogin,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  prefixIcon: Container(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.lightGreen,
                      )),
                  hintText: "Entre com seu e-mail",
                  hintStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  labelStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.greenAccent),
            ),
            const SizedBox(height: 30.0),
            Container(
              height: SizeConfig.blockSizeVertical! * 11,
              alignment: Alignment.centerLeft,
              child: SizedBox.expand(
                child: ValueListenableBuilder<bool>(
                  valueListenable: _controller.inLoader,
                  builder: (_, inLoader, __) => inLoader
                      ? const Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: Colors.green,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 5,
                                width: SizeConfig.safeBlockHorizontal! * 5,
                                child:
                                    Image.asset("assets/imagens/paw-128.png"),
                              )
                            ],
                          ),
                          onPressed: () {
                            _controller.auth().then(
                              (result) {
                                if (result) {
                                  print("Sucesso");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                } else {
                                  BaseService.alert.error(
                                    context,
                                    "Falha ao realizar login, verifique seu e-mail",
                                    TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal! * 3.4,
                                    ),
                                  );
                                  print("Erro");
                                }
                              },
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

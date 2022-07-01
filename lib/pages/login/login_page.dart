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
    // Future.delayed(const Duration(seconds: 3)).then((_) =>
    //     Navigator
    //         .of(context)
    //         .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
    //       return new LoginPage();
    //     })));

    //  Navigator.of(context).pushReplacementNamed('/login-page'));
    super.initState();
  }



  void _init() async {
    teste();
  }
    // var box = await Hive.openBox('token');
    // String? tokenStored = box.get('token');
    // if (tokenStored != null) {
    //   Navigator.pushReplacementNamed(_context, '/home');
    // }

  //
  //   Future.wait(
  //       //     [PrefsService.isAuth(), Future.delayed(const Duration(seconds: 1))],
  //       //   ).then((value) async => value[0]
  //       //       ?  await Navigator.of(context)
  //       //       .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
  //       //     return const HomePage();
  //       //   }))
  // }

  void teste(){
    Future.wait(
      [PrefsService.isAuth(), Future.delayed(const Duration(milliseconds: 1))],
    ).then((value) async => value[0]
        ?  await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const HomePage();
    }))
        : null

    // await Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    //   return LoginPage();
    // }))
    );

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
              width: 128,
              height: 128,
              child: Image.asset("assets/imagens/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              onChanged: _controller.setLogin,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: _controller.setSenha,
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            // Container(
            //   height: 40,
            //   alignment: Alignment.centerRight,
            //   child: FlatButton(
            //     child: Text(
            //       "Recuperar Senha",
            //       textAlign: TextAlign.right,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => ResetPasswordPage(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFF58524),
                    Color(0XFFF92B7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                  child: ValueListenableBuilder<bool>(
                      valueListenable: _controller.inLoader,
                      builder: (_, inLoader, __) => inLoader
                          ? Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator()))
                          : FlatButton(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Container(
                                    child: SizedBox(
                                      child: Image.asset(
                                          "assets/imagens/bone.png"),
                                      height: 28,
                                      width: 28,
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () {
                                _controller.auth().then((result) {
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
                                            SizeConfig.safeBlockHorizontal! *
                                                3.4,
                                      ),
                                    );
                                    print("Erro");
                                  }
                                });
                              },
                            ))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Text(
                      //   "Login com Facebook",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                      // Container(
                      //   child: SizedBox(
                      //     child: Image.asset("assets/fb-icon.png"),
                      //     height: 28,
                      //     width: 28,
                      //   ),
                      // )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Container(
            //   height: 40,
            //   child: FlatButton(
            //     child: Text(
            //       "Cadastre-se",
            //       textAlign: TextAlign.center,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => SignupPage(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

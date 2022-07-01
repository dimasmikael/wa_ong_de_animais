import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/base.service.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/controllers/login-controller.dart';
import 'package:projeto_pet_adoption_app/pages/home/home_page.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

class LoginPageWidget extends StatelessWidget {
  LoginPageWidget({Key? key}) : super(key: key);
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 30,
            width: SizeConfig.safeBlockHorizontal! * 30,
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
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade50,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: SizeConfig.safeBlockVertical! * 5,
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
                    ? Center(
                        child: SizedBox(
                          height: SizeConfig.safeBlockVertical! * 4,
                          width: SizeConfig.safeBlockHorizontal! * 4,
                          child: const CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        height: SizeConfig.safeBlockVertical! * 1,
                        width: SizeConfig.safeBlockHorizontal! * 1,
                        child: ElevatedButton(
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
                              textoLoginButton(
                                "Login",
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
                                }
                              },
                            );
                          },
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

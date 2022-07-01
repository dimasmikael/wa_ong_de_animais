import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_pet_adoption_app/services/prefs-service.dart';
import 'package:projeto_pet_adoption_app/shared/constants/constants.dart';


class LoginController {

List emails=[];

 Future<List<dynamic>> getUsers() async {

    String baseUrl = Constants.BASE_URL_User;
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('$baseUrl/users'));

      var _lisEmails = jsonDecode(response.body) as List;
      // List<UsuarioModel> usuarios =
      //     decodedResponse.map((e) => UsuarioModel.fromJson(e)).toList();
        _lisEmails .forEach((element) {
          emails.add(element['email']);

      });

      // List usuarios =
      //     decodedResponse;
      print(emails);
     // return usuarios;
      return emails ;
    } finally {
      client.close();
    }
  }

  _getUsers() {
    getUsers()
        ;
  }

  LoginController(){
    _getUsers();
  }

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
List _loginlist=["teste@"];



  String? _login;
  setLogin(String value) => _login = value;
  String? _senha;
  setSenha(String value) => _senha = value;
  Future<bool> auth() async {
// if(_login=='admin' && _senha =='123')
//     print('login:$_login,senha:$_senha');
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));

    inLoader.value = false;
   // _loginlist.add(emails);

    if (

    emails.contains(_login)

     //   _login=='1'
      //  && _senha == '123'
    ) {
      PrefsService.save(_login!);
      return true;
    }
    return false;
  }
}

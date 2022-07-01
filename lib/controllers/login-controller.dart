import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/services/prefs-service.dart';
import 'package:projeto_pet_adoption_app/shared/constants/constants.dart';

class LoginController {
  List emails = [];

  PetModel petModel = PetModel();

  Future<List<dynamic>> getUsers() async {
    String baseUrl = Constants.BASE_URL_User;
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('$baseUrl/users'));
      var _lisEmails = jsonDecode(response.body) as List;

      _lisEmails.forEach(
        (element) {
          emails.add(element['email']);
        },
      );

      return emails;
    } finally {
      client.close();
    }
  }

  _getUsers() {
    getUsers();
  }

  LoginController() {
    _getUsers();
  }

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );

    inLoader.value = false;

    if (emails.contains(_login)) {
      PrefsService.save(_login!);

      return true;
    }
    return false;
  }
}

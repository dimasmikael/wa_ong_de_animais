import 'dart:convert';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/shared/constants/constants.dart';
import 'package:http/http.dart' as http;

class PetController {
  static Future<List<PetModel>> getCachorros() async {
    String baseUrl = Constants.BASE_URL_DOG;
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(
          '$baseUrl/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37'));

      var decodedResponse = jsonDecode(response.body) as List;
      List<PetModel> cachorros =
          decodedResponse.map((e) => PetModel.fromJson(e)).toList();

      return cachorros;
    } finally {
      client.close();
    }
  }

  static Future<List<PetModel>> getGatos() async {
    String baseUrl = Constants.BASE_URL_CAT;
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('$baseUrl/v1/breeds?193eb978-f75c-4ab5-a19d-86e25fa390c6'));

      var decodedResponse = jsonDecode(response.body) as List;
      List<PetModel> gatos =
          decodedResponse.map((e) => PetModel.fromJson(e)).toList();

      return gatos;
    } finally {
      client.close();
    }
  }
}

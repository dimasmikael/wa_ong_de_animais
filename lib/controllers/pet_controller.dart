import 'dart:convert';
import 'package:projetos/models/cachorro-model.dart';
import 'package:http/http.dart' as http;
import 'package:projetos/models/gato-model.dart';
import 'package:projetos/shared/constants/constants.dart';

class PetController {
  Future<List<CachorroModel>> getCachorros() async {
    String baseUrl = Constants.BASE_URL_DOG;
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(
          '$baseUrl/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37'));

      var decodedResponse = jsonDecode(response.body) as List;
      List<CachorroModel> cachorros =
      decodedResponse.map((e) => CachorroModel.fromJson(e)).toList();
      print(cachorros);
      return cachorros;
    } finally {
      client.close();
    }
  }

  Future<List<GatoModel>> getGatos() async {
    String baseUrl = Constants.BASE_URL_CAT;
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('$baseUrl/v1/breeds?193eb978-f75c-4ab5-a19d-86e25fa390c6'));

      var decodedResponse = jsonDecode(response.body) as List;
      List<GatoModel> gatos =
      decodedResponse.map((e) => GatoModel.fromJson(e)).toList();
      //  print(gatos);
      return gatos;
    } finally {
      client.close();
    }
  }

  Future<GatoModel> getGato() async {
    String baseUrl = Constants.BASE_URL_CAT;
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://api.thecatapi.com/v1/images/search?breed_ids=abys'));

      var decodedResponse = jsonDecode(response.body) as List;
    GatoModel gato =
      decodedResponse.map((e) => GatoModel.fromJson(e)).toList().first;
      //  print(gatos);
      return gato;
    } finally {
      client.close();
    }
    //   String baseUrl = Constants.BASE_URL_CAT;
    //   var client = http.Client();
    //   try {
    //     var response = await client.get(
    //         Uri.parse('https://api.thecatapi.com/v1/images/search?breed_ids=abys'));
    //
    //     var decodedResponse = jsonDecode(response.body);
    //     GatoModel gato =
    //     decodedResponse.map((e) => GatoModel.fromJson(e[0])) as GatoModel;
    //      print(gato);
    //     return gato;
    //   } finally {
    //     client.close();
    //   }
    // }

  }
}
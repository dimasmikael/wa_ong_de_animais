import 'dart:convert';

import 'package:projetos/models/Cachorros.dart';
import 'package:projetos/pages/home/home_repository.dart';
import 'package:projetos/shared/constants.dart';
import 'package:projetos/shared/services/custom_dio/custom_dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class CachorrosApi {
  // late final CustomDio client;








static Future getCachorros1()async{
  var url = BASE_URL+'v1/breeds';
  return await http.get( Uri.parse( url));
 // var uri = Uri.https('api.thedogapi.com', 'v1/breeds');
 //  return await http.get(uri);
}
 // static Future<Album> fetchAlbum() async {
 //    final response = await http
 //        .get(Uri.parse("https://api.thedogapi.com/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37"));
 //
 //    if (response.statusCode == 200) {
 //      // If the server did return a 200 OK response,
 //      // then parse the JSON.
 //
 //
 //      return Album.fromJson(jsonDecode(response.body));
 //    } else {
 //      // If the server did not return a 200 OK response,
 //      // then throw an exception.
 //      throw Exception('Failed to load album');
 //    }
 //  }

  getCachorros() async {
    Uri uri = Uri.https('api.thedogapi.com', 'v1/breeds');
    final future = http.get(uri);
    future.then((response) {
      if (response.statusCode == 200) {
        // print("Pagina carregada");
        // print(json.decode(response.body));

        // Map<>
        var  dados = json.decode(response.body) as List ;


    //    Map<String, dynamic> dados = json.decode(response.body);
        //
        //
        //    print(dados[0]['name']);

        // List<Cachorros>cachorros = json.decode(response.body);
        // print(cachorros[0].id);

        //    Filhote filhote = Filhote();

     // List<   Breeds> breeds = Breeds(dados);
        var minhaLista = Filhotes(dados);
        var cachorro;
minhaLista.filhotes.forEach((element) {
   cachorro = Cachorros.fromJson(element);
  print(cachorro.id.toString());
});

       print(minhaLista.filhotes[0]["name"]);
       return cachorro;
      } else {
        print('Erro');
        print(response.request);
      }
    });

    // final client = RetryClient(http.Client());
    // try {
    //   print(await client.read(Uri.parse('https://api.thedogapi.com/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37')));
    // } finally {
    //   client.close();
    // }

    //   var url = Uri.parse('https://api.thedogapi.com');
    //   var response = await http.post(url, body: '/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37');
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    // dynamic reponse = (Uri.parse('https://api.thedogapi.com/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37'));
    //  // print(await http.read(Uri.parse('https://api.thedogapi.com/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37')));
    //
    //   print(json.decode(reponse.body));
  }

  //  String  url = '$BASE_URL/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37';
  // // print(url);
  //  final client = RetryClient(http.Client());
  //  try {
  //    print(await client.read(Uri.parse(url)));
  //  } finally {
  //    client.close();
  //  }
  //
  //
  //
  // // var client= await client.get(BASE_URL);
  //
  //  print(client.get(Uri.parse( url ??"")));
  //
  //  return (client as List ).map((e) => Cachorros.fromJson(e)).toList();

}

//
// class Filhote {
//   final String? nome;
//
//   Filhote( {this.nome});
//
//   factory Filhote.fromJson(Map<String, dynamic> json) {
//   return  Filhote(
//       json['name'],
//     );
//   }
// }
class Filhotes {
final List filhotes;

Filhotes(this.filhotes);
}




// class Breeds {
//
//  final String? nome;
//
//
//   Breeds({
//
//     this.nome,
//   });
//
//   Breeds.fromJson(Map<String, dynamic> json) {
//     nome = json['name'];
//   }
// }

class Album {
  // final int userId;
  // final int id;
  final String nome;

  const Album({
    // required this.userId,
    // required this.id,
    required this.nome,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      // userId: json['userId'],
      // id: json['id'],
      nome: json['name'],
    );
  }
  Map<String, dynamic> toJson() => {
    'name': nome,

  };
  }

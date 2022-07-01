// import 'dart:convert';
// import 'package:projetos/models/cachorro-model.dart';
// import 'package:http/http.dart' as http;
//
//
// class LoginData {
//
//
//   Future<String> getJSONData() async {
//     Uri url = Uri.parse( "https://jsonplaceholder.typicode.com/posts/1");
//     var response = await http.get(
//         Uri.encodeFull(url),
//         headers: {"Accept": "application/json"}
//     );
//     setState(() {
//       // otem os dados JSON
//       data = json.decode(response.body)['results'];
//     });
//     return "Dados obtidos com sucesso";
//   }
//
// }
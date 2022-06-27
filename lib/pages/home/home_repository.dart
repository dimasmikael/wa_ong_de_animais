import 'package:projetos/shared/models/contact_model.dart';
import 'package:projetos/shared/services/custom_dio/custom_dio.dart';

class HomeRepository {

  late final CustomDio client;
HomeRepository(client);

  Future<List<ContactModel>>? getContacts() async {
var response = await client.get("/photos");

return (response.data as List).map((e) =>ContactModel.fromJson(e)).toList();
  }
}

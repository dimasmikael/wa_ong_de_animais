import 'package:projetos/pages/home/home_repository.dart';
import 'package:projetos/shared/models/contact_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final HomeRepository? repo;

  HomeBloc(this.repo) {
    contactsOut = _contacts.stream;
    _contactsIn = _contacts.sink;
  }

  //?STREAMS
  final _contacts = BehaviorSubject<List<ContactModel>>();

  late ValueStream  <List<ContactModel>> contactsOut;
  late Sink<List<ContactModel>> _contactsIn;

  Future<void> getContacts() async {
    try {
      var response = await repo?.getContacts();
      _contactsIn.add(response!);
    } catch (e) {
      _contacts.addError(e);
    }
  }

  void dispose() {
    _contacts.close();
    _contactsIn.close();
  }
}

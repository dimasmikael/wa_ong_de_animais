import 'package:flutter/material.dart';
import 'package:projetos/shared/models/contact_model.dart';

class ContactTileWidget extends StatelessWidget {

  final ContactModel snapshot;
  const ContactTileWidget({Key? key,  required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(snapshot.title!),
      subtitle: Text(snapshot.id.toString()!),
      leading: CircleAvatar(

        backgroundImage:  NetworkImage(snapshot.thumbnailUrl!),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardTitle extends StatefulWidget {
  final String? titulo;

  CardTitle({Key? key, this.titulo});

  @override
  _CardTitleState createState() => _CardTitleState();
}

class _CardTitleState extends State<CardTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Text(
          widget.titulo??"",
          style: const TextStyle(fontSize: 20),
        ));
  }
}

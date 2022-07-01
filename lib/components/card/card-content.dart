import 'package:flutter/material.dart';

class CardContent extends StatefulWidget {
  final Widget? content;

  CardContent({Key? key, this.content});

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10), child: widget.content);
  }
}

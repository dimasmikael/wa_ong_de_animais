import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/card/card-content.dart';
import 'package:projeto_pet_adoption_app/components/card/card-title.dart';


class CustomCard extends StatefulWidget {
  final String? titulo;
  final Widget? content;
  final double? largura;
  final double? altura;
  final RoundedRectangleBorder? shape;
  final Color? color;
  final Clip? clipBehavior;
  final EdgeInsets? margin;

  CustomCard(
      {Key? key,
      this.titulo,
      this.content,
      this.largura = 1000,
      this.altura,
      this.shape,
      this.color,
      this.clipBehavior,
      this.margin});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Widget _secaoTitulo() {
    return widget.titulo != null
        ? Align(
            alignment: Alignment.topLeft,
            child: CardTitle(
              titulo: widget.titulo ?? '',
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.largura,
      height: widget.altura,
      child: Card(
        shape: widget.shape,
        clipBehavior: widget.clipBehavior,
        color: widget.color,
        child: Column(
          children: [
            _secaoTitulo(),
            CardContent(content: widget.content),
          ],
        ),
      ),
    );
  }
}

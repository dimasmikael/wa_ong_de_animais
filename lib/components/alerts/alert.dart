import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

class Alert {
  void error(BuildContext context, String text, [TextStyle? textStyle]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: textoAlert(text),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: "",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void success(BuildContext context, String text, [TextStyle? textStyle]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: textoAlert(
          text,
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: "",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}

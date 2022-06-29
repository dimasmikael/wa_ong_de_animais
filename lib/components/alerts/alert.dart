import 'package:flutter/material.dart';

class Alert {
  void error(BuildContext context, String text,[TextStyle? textStyle]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
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
        content: Text(
          text,style: textStyle,
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

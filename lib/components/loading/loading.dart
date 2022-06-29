import 'package:flutter/material.dart';

class Loading {
  void start(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
      builder: (BuildContext context) => Container(
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
            // size: 50.0,
          ),
        ),
      ),
    );
  }

  void stop(context) {
    Navigator.pop(context);
  }
}

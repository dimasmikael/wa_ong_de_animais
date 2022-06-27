import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child:Column(children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: ("Username")
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
              labelText: ("Password")
          ),
        )

      ],)
    );
  }
}

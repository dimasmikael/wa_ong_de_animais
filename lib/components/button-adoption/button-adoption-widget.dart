import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/base.service.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/main.dart';


class ButtonAdoptionWidget extends StatefulWidget {
  const ButtonAdoptionWidget({Key? key}) : super(key: key);

  @override
  _ButtonAdoptionWidgetState createState() => _ButtonAdoptionWidgetState();
}

class _ButtonAdoptionWidgetState extends State<ButtonAdoptionWidget> {
  @override
  void initState() {
    _isButtonDisabled = false;
  }

  late bool _isButtonDisabled;

  void _enabled() {
    setState(() {
      _isButtonDisabled = true;
      BaseService.alert.success(
        context,
        "Successfully adopted pet!",
        TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal! * 3.4,
        ),
      );
    });
  }

  void _disabled() {
    setState(() {
      _isButtonDisabled = false;
      BaseService.alert.error(
        context,
        "Request canceled!",
        TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal! * 3.4,
        ),
      );
    });
  }

  Color? colorButton() {
    // if (themeManager.themeMode == ThemeMode.dark && _isButtonDisabled == true) {
    //   setState(() {
    //     ThemeData.dark().backgroundColor;
    //   });
    // } else {
    //   setState(() {
    //     Colors.yellow;
    //   });
    // }
    if (themeManager.themeMode == ThemeMode.light &&
        _isButtonDisabled == true) {
      setState(() {
        ThemeData.light().backgroundColor;
      });
    } else {
      setState(() {
        Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_isButtonDisabled);
    print(themeManager.themeMode);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: themeManager.themeMode == ThemeMode.light &&
                  _isButtonDisabled == true
              ? Colors.red
              : themeManager.themeMode == ThemeMode.light &&
                      _isButtonDisabled == false
                  ? Colors.green
                  : themeManager.themeMode == ThemeMode.dark &&
                          _isButtonDisabled == true
                      ? Colors.red.shade300
                      : Colors.green.shade300),
      child: Text(_isButtonDisabled ? "Cancel" : "Adoption"),
      onPressed: _isButtonDisabled ? _disabled : _enabled,
    );
  }
}

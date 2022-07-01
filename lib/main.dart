import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pet_adoption_app/pages/splash/splash-page.dart';
import 'package:projeto_pet_adoption_app/shared/theme/theme_manager.dart';
import 'shared/theme/theme_constants.dart';

void main() async {
  runApp(MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: const SplashPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projetos/pages/home/splash-page.dart';
import 'package:projetos/shared/theme/theme_manager.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      // initialRoute: '/splash',
      home: const SplashPage(),
      // routes: {
      //   '/splash': (context) => const SplashPage(),
      //   '/': (context) => const HomePage(),
      //   '/login-page': (context) => const LoginPage(),
      // },
    );
  }
}

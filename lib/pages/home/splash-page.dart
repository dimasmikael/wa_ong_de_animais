import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projetos/pages/home/home_page.dart';
import 'package:projetos/pages/login/login_page.dart';
import 'package:projetos/services/prefs-service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return
      AnimatedSplashScreen(
        splash: Image.asset('assets/imagens/dogsanimated.png'),
        nextScreen:   LoginPage(),
        splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Colors.white,
        duration: 500,
        splashIconSize: 300,

      );
      //
      // Container(
      //   color: Colors.green.shade900,
      //   child: const Center(
      //     child: CircularProgressIndicator(),
      //   ));
  }
}

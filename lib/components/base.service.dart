import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alerts/alert.dart';
import 'loading/loading.dart';

abstract class BaseService {
  static Alert alert = Alert();
  static Loading loading = Loading();

  static setDefaultNavigationAndStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.amber,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
  }
}

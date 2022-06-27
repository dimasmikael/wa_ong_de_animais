import 'package:dio/native_imp.dart';
import 'package:projetos/shared/constants.dart';

class CustomDio extends DioForNative {
  CutomDio(){
    options.baseUrl=BASE_URL;
  }
}
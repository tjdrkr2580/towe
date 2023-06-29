import 'package:dio/dio.dart';

class DioSingleton {
  static Dio? _dioInstance;

  static Dio get dio {
    _dioInstance ??= Dio();
    return _dioInstance!;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:towe/service/dio_singleton.dart';

class UserService {
  Future postRegister(memberName, nickName, password, email, birthDay) async {
    String apiUrl = "${dotenv.env['TOWE_DEFAULT_URL']!}members/signup";
    try {
      Response response = await DioSingleton.dio.post(apiUrl, data: {
        "memberName": memberName,
        "email": email,
        "password": password,
        "birthday": birthDay,
        "nickName": nickName,
      });
      return response;
    } catch (e) {
      return null;
    }
  }

  Future postLogin(memberName, password) async {
    String apiUrl = "${dotenv.env['TOWE_DEFAULT_URL']!}members/login";
    try {
      Response response = await DioSingleton.dio.post(apiUrl, data: {
        "memberName": memberName,
        "password": password,
      });
      DioSingleton.dio.options.headers['authorization'] =
          response.headers.map['authorization']!.first;
      print(DioSingleton.dio.options.headers);
      return response;
    } catch (e) {
      return null;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserService {
  Future postRegister(memberName, nickName, password, email, birthDay) async {
    Dio dio = Dio();
    String apiUrl = "${dotenv.env['TOWE_DEFAULT_URL']!}members/signup";
    try {
      Response response = await dio.post(apiUrl, data: {
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
    Dio dio = Dio();
    String apiUrl = "${dotenv.env['TOWE_DEFAULT_URL']!}members/login";
    try {
      Response response = await dio.post(apiUrl, data: {
        "memberName": memberName,
        "password": password,
      });
      return response;
    } catch (e) {
      return null;
    }
  }

  // Future postLogin(memberName, password) async {
  //   String apiUrl = "${dotenv.env['TOWE_DEFAULT_URL']!}members/signup";
  //   LoginData data = LoginData(memberName: memberName, password: password);
  //   if (response == null) {
  //     return null;
  //   }
  //   return response;
  // }
}

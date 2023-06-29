import "package:dio/dio.dart";
import "package:towe/service/dio_singleton.dart";

class NetworkHelper {
  static final NetworkHelper _instance = NetworkHelper._internal();
  factory NetworkHelper() {
    return _instance;
  }
  NetworkHelper._internal();

  final Dio dio = Dio();

  Future getData(String url) async {
    try {
      Response response = await DioSingleton.dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return responseData;
    } catch (e) {
      return null;
    }
  }

  // Future postData(String url, dynamic data) async {
  //   try {
  //     Response response = await dio.post(url, data: data);
  //     print(re)
  //     return response.data;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}

import "dart:convert";

import "package:http/http.dart";

class NetworkHelper {
  static final NetworkHelper _instance = NetworkHelper._internal();
  factory NetworkHelper() {
    return _instance;
  }
  NetworkHelper._internal();

  Future getData(String url) async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}

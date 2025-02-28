import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "https://cbu.uz/uz/arkhiv-kursov-valyut/json/";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String apiPosts = "";
  static String apiPostCreate = "";
  static String apiUpdatePost = "/users/";
  static String apiDeletePost = "/users/";

  static Future<String> GET() async {
    var url = Uri.parse(BASE);
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "Xatolik bor";

  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<Walyuta> parseWalyutaList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Walyuta>.from(json.map((element) => Walyuta.fromJson(element)));
    return data;
  }
}

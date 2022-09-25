import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:revision_api/model/model_class.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  Future<List<Public>> fetchData() async {
    String api = "https://reqres.in/api/users?page=2";

    http.Response res = await http.get(Uri.parse(api));

    Map data = jsonDecode(res.body);
    List allData = data['data'];
    List<Public> response = allData.map((e) => Public.fromJson(e)).toList();

    return response;
  }
}

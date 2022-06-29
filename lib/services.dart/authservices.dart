import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/Header.dart';
import 'package:tiktaktoe/core/NetworkClient.dart';

import '../models/loginresponsemodel.dart';

class Authservices {
  Future<LoginRosponseModel?> login(String username, String password) async {
    final http.Response? response = await NetworkClient().postRequest(
        path: ApiEndpoints.loginUrl,
        body: {"username": username, "password": password});
    // final http.Response? response = await http.post(
    //     Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.loginUrl),
    //     headers: getHeader(),
    //     body: {
    //       "username": username,
    //       "password": password,
    //     });
    // log(response!.body);
    LoginRosponseModel? model;
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(response.body);
      model = LoginRosponseModel.fromjson(json);
    }

    return model;
    // log(model.Status.toString());
  }
}

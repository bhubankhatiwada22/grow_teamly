import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/Header.dart';
import 'package:tiktaktoe/helpers/snack.dart';
import 'package:tiktaktoe/injector.dart';
import 'package:tiktaktoe/main.dart';

class NetworkClient {
  Future<http.Response?> getRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path}) async {
    http.Response? response;
    try {
      response =
          await http.get(Uri.parse(baseUrl + path), headers: getHeader());
      if (response.statusCode == 200) {
        locator.get<SharedPreferences>().setString(path, response.body);
      }
    } catch (e) {
      final _cacheValue = locator<SharedPreferences>().getString(path);
      if (_cacheValue != null) {
        response = http.Response(_cacheValue, 200);
      }
      AppSnackbar.showSnackbar(AppSetting.navigator.currentContext!,
          message: "something went wrong");
    }
    log(response != null ? response.statusCode.toString() : "response is null");
    return response;
  }

  Future<http.Response?> postRequest(
      {String baseUrl = ApiEndpoints.baseUrl,
      required String path,
      Map<String, dynamic>? body}) async {
    http.Response? responce;
    try {
      responce = await http.post(
        Uri.parse(baseUrl + path),
        headers: getHeader(),
        body: body,
      );
    } catch (e) {
      print(e.toString());
    }
    log(responce != null ? responce.statusCode.toString() : "response is null");

    return responce;
  }
}

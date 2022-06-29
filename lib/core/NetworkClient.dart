import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/Header.dart';

class NetworkClient {
  Future<http.Response?> getRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path}) async {
    http.Response? response;
    try {
      response =
          await http.get(Uri.parse(baseUrl + path), headers: getHeader());
    } catch (e) {
      print(e.toString());
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

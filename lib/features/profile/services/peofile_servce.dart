import 'dart:convert';

import 'package:http/http.dart';
import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/NetworkClient.dart';
import 'package:tiktaktoe/models/profileModel.dart';

class ProfileServices {
  Future<ProfileModel?> fetchProfile() async {
    final responce = await NetworkClient().getRequest(
      path: ApiEndpoints.loginProfile,
    );
    ProfileModel? profile;
    if (responce != null && responce.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(responce.body);
      profile = ProfileModel.fromjson(json);
    }
    return profile;
  }
}

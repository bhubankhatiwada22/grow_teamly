import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/constants/app_constant.dart';
import 'package:tiktaktoe/injector.dart';

Map<String, String> getHeader() {
  Map<String, String> header = {"Accept": "application/json"};
  String? token = locator<SharedPreferences>().getString(AppConstants.token);
  if (token != null) {
    Map<String, String> authorizationHeader = {
      "authorization": "Bearer $token"
    };
    header.addAll(authorizationHeader);
  }
  return header;
}

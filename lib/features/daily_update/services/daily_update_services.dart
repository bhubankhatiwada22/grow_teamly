import 'dart:convert';
import 'dart:math';

import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:tiktaktoe/features/daily_update/model/daily_update_model.dart';

class DailyUpdateServices {
  Future<List<DAilyUpdateModel>> fetchDailyUpdates() async {
    final http.Response? response =
        await NetworkClient().getRequest(path: ApiEndpoints.dailyupdate);
    List<DAilyUpdateModel> dailyUpdates = [];
    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((e) {
        DAilyUpdateModel dailyUpdate = DAilyUpdateModel.fromjson(e);
        dailyUpdates.add(dailyUpdate);
      });
    }
    return dailyUpdates;
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:tiktaktoe/constants/api_endpoints.dart';
import 'package:tiktaktoe/core/NetworkClient.dart';
import 'package:tiktaktoe/features/dashboard/models/dash_card_model.dart';

class DashboardServices {
  Future<DashboardCardModel?> fetchDashboardCardData() async {
    final Response? response =
        await NetworkClient().getRequest(path: ApiEndpoints.dashboardCardData);
    DashboardCardModel? dashboardCardModel;
    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dashboardCardModel = DashboardCardModel.fromJson(jsonResponse);
    } else {
      dashboardCardModel = null;
    }
    return dashboardCardModel;
  }
}

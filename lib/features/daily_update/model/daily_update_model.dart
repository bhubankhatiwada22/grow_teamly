import 'package:tiktaktoe/features/daily_update/views/daily_update_view.dart';

class DAilyUpdateModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? projectId;
  String? acknowdedgedAt;

  DAilyUpdateModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.projectId,
    this.acknowdedgedAt,
  });
  DAilyUpdateModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    acknowdedgedAt = json['acknowledge_at'];
  }
}

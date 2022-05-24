import 'package:porjectretrofit/model/api.dart';

class ApiResponse {
  List<Api> api;

  ApiResponse({this.api});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['allitems'] != null) {
      api = [];
      json['allitems'].forEach((v) {
        api.add( Api.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.api != null) {
      data['allitems'] = this.api.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
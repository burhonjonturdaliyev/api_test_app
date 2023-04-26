import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:api_test_app/models/models_sevice.dart';
import 'package:http/http.dart';

class ServiceAPI {
  static Future<List<MyService>?> getServices() async {
    const uri = "http://185.196.213.43:7088/service-category";
    final url = Uri.parse(uri);

    print("Loading is starting");
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      print("Responce is very good");
      final body = response.body;
      final json = jsonDecode(body);
      print(json["object"]);
      final result = json["object"] as List<dynamic>;
      final services = result.map((e) {
        return MyService(
            id: e["id"],
            createdAt: e["createdAt"],
            createdBy: e["createdBy"],
            updatedAt: e["updatedAt"],
            modifiedBy: e['modifiedBy'],
            deleted: e["deleted"],
            name: e["name"],
            icon: e["icon"],
            categoryType: e["categoryType"]);
      }).toList();
      print("Loading is finished");
      return services;
    }
    return null;
  }
}

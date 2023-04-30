import 'dart:convert';

import 'package:api_test_app/models/models_get.dart';
import 'package:flutter/material.dart';
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

class Support_Api {
  static Future<List<Data>?> fetchMessage(BuildContext context) async {
    const url = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
    final uri = Uri.parse(url);
    try {
      print("Loading is start");
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        print(json["object"]);

        final result = json["object"][1] as List<dynamic>;

        final message = result.map(
          (e) {
            final dialogs = Dialogs(
              createdAt: e["dialogs"][0]["createdAt"] ?? "",
              userId: e["dialogs"][0]["userId"] ?? 0,
              fistName: e["dialogs"][0]["fistName"] ?? "",
              lastName: e["dialogs"][0]["lastName"] ?? "",
              accountType: e["dialogs"][0]["accountType"] ?? "",
              message: e["dialogs"][0]["message"] ?? "",
            );
            return Data(
              id: e["id"] ?? 0,
              createdAt: e["createdAt"] ?? "",
              updatedAt: e["updatedAt"] ?? "",
              deleted: e["deleted"] ?? false,
              userId: e["userId"] ?? 0,
              status: e["status"] ?? "",
              dialogs: dialogs,
            );
          },
        ).toList();
        return message;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
  }
}

import 'dart:convert';

import 'package:api_test_app/models/models_get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Test_api extends StatefulWidget {
  const Test_api({super.key});

  @override
  State<Test_api> createState() => _Test_apiState();
}

class _Test_apiState extends State<Test_api> {
  List<Welcome> models = [];

  void fetchMessage() async {
    const url = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
    final uri = Uri.parse(url);
    try {
      print("Loading is start");
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        print(json["object"]);
        final result = json["object"] as List<dynamic>;
        final message = result.map((e) {
          return welcomeFromJson(json);
        }).toList();
        setState(() {
          models = message;
        });
        print(models.length);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));

      Text("Error is here => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: fetchMessage),
      appBar: AppBar(title: const Text("Test APi's")),
      body: models.isEmpty
          ? Center(child: Text("Data yuklanmoqda"))
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) => items(models[index], index)

              //items(models[index], index),
              ),
    );
  }
}

Widget items(Welcome models, index) {
  return ListTile(
    title: Text(""),
  );
}

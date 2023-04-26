import 'package:api_test_app/functions/rest_api.dart';
import 'package:api_test_app/models/models_sevice.dart';
import 'package:flutter/material.dart';

class MyServiceItems extends StatefulWidget {
  const MyServiceItems({super.key});

  @override
  State<MyServiceItems> createState() => _MyServiceItemsState();
}

class _MyServiceItemsState extends State<MyServiceItems> {
  List<MyService> models = [];

  Future<void> getServices() async {
    final responce = await ServiceAPI.getServices();
    setState(() {
      models = responce!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getServices),
      appBar: AppBar(title: const Text("Service GEtting")),
      body: models.isEmpty
          ? const Center(
              child: Text("There is not data here"),
            )
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) => items(models[index]),
            ),
    );
  }
}

Widget items(MyService models) {
  return ListTile(
    leading: Text(models.name.toString()),
    title: CircleAvatar(child: Text(models.id.toString())),
  );
}

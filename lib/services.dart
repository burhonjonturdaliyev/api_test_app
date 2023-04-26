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

    // const uri = "http://185.196.213.43:7088/service-category";
    // final url = Uri.parse(uri);
    // try {
    //   print("Loading is starting");
    //   Response response = await http.get(url);
    //   if (response.statusCode == 200) {
    //     print("Responce is very good");
    //     final body = response.body;
    //     final json = jsonDecode(body);
    //     print(json["object"]);
    //     final result = json["object"] as List<dynamic>;
    //     final services = result.map((e) {
    //       return MyService(
    //           id: e["id"],
    //           createdAt: e["createdAt"],
    //           createdBy: e["createdBy"],
    //           updatedAt: e["updatedAt"],
    //           modifiedBy: e['modifiedBy'],
    //           deleted: e["deleted"],
    //           name: e["name"],
    //           icon: e["icon"],
    //           categoryType: e["categoryType"]);
    //     }).toList();

    //     setState(() {
    //       models = services;
    //     });
    //     print(models.length);
    //   }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("Error: $e"),
    //   ));
    //   print("Here is your error => $e");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getServices),
      appBar: AppBar(title: Text("Service GEtting")),
      body: models.isEmpty
          ? Center(
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

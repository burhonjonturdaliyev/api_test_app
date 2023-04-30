import 'package:api_test_app/functions/rest_api.dart';
import 'package:api_test_app/models/models_get.dart';
import 'package:api_test_app/screen/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Test_api extends StatefulWidget {
  const Test_api({super.key});

  @override
  State<Test_api> createState() => _Test_apiState();
}

class _Test_apiState extends State<Test_api> {
  late SharedPreferences logindata;
  late bool new_user;
  List<Data> models = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      logindata = prefs;
    });
  }

  void fetchMessage() async {
    final responce = await Support_Api.fetchMessage(context);
    setState(() {
      models = responce!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: fetchMessage),
      appBar: AppBar(
        title: const Text("Test APi's"),
        actions: [
          IconButton(
              onPressed: () {
                logindata.setBool("login", true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: models.isEmpty
          ? Center(child: Text("Data yuklanmoqda"))
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) => items(models[index], index)

              //items(models[index], index),
              ),
    );
  }

  Widget items(Data models, index) {
    return ListTile(
      title: Text(models.id.toString()),
      leading: Text(
        models.dialogs.message,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

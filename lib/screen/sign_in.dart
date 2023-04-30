import 'package:api_test_app/Test_api.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SharedPreferences logindata;
  late bool new_user;
  final _formkey = GlobalKey<FormState>();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    check_login();
    // createDatabase();
  }

  @override
  void dispose() {
    mail.dispose();
    password.dispose();
    super.dispose();
  }

  void check_login() async {
    logindata = await SharedPreferences.getInstance();
    new_user = (logindata.getBool("login") ?? true);

    print("new user");
    if (new_user == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Test_api(),
          ));
    }
  }

  // void getData() async {
  //   if (box1.get("email") != null) {
  //     mail.text = box1.get("email");
  //   }
  //   if (box1.get("password") != null) {
  //     password.text = box1.get("password");
  //   }
  // }

  // void createDatabase() async {
  //   box1 = await Hive.openBox("LoginData");
  //   getData();
  // }

  // void login() {
  //   box1.put("email", mail.text);
  //   box1.put("password", password.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: mail,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill your mail";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Here is a mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Here is a password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21))),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    // login();

                    String email = mail.text;
                    String pass = password.text;
                    print("Succesfully");
                    logindata.setBool("login", false);
                    logindata.setString("email", email);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Test_api(),
                        ));
                  }
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

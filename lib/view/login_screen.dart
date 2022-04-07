import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_list_api/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

import 'list_kebun_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return Scaffold(
                body: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/flutter_icon.png", width: 70, height: 70,),
                      const SizedBox(height: 36,),
                      const Text("Aplikasi Baru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      const SizedBox(height: 16,),
                      const Text("Silahkan Login"),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            labelText: "Username",
                            hintText: "contoh : indocyber"
                        ),
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(height: 36,),
                      ElevatedButton(
                          onPressed: () async {
                            String username = usernameController.text.toString();
                            String password = passwordController.text.toString();

                            // note: login viewmodel without return
                            viewModel.login(username, password, context);

                            // note : login viewmodel with return
                            // var loginFunction = await viewModel.loginWithReturn(username, password, context);
                            // if (loginFunction == true) {
                            //   print("masuk");
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => ListKebunScreen()));
                            // }

                          },
                          child: const Text("Login")
                      ),
                    ],
                  ),
                ),
              );
            });
        },
      ),
    );
  }
}

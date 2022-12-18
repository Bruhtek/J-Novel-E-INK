import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/services/jnovel/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final getIt = GetIt.instance;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    getIt<JNovelApi>().login(
      _loginController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Login"),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () => _login(),
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

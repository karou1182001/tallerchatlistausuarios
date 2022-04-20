import 'package:f_chat_template/ui/controllers/chat_controller.dart';
import 'package:f_chat_template/ui/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthenticationController authenticationController = Get.find();
  ChatController chatController = Get.find();

  void signIn() {
    authenticationController.signup('a@a.com', '123456');
    authenticationController.signup('b@b.com', '123456');
    authenticationController.signup('c@c.com', '123456');
  }

  void login(String user) {
    authenticationController.login(user, '123456');
    chatController.readData();
    print('Funciona');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      login('a@a.com');
                    },
                    child: const Text("Login A")),
                ElevatedButton(
                    onPressed: () async {
                      login('b@b.com');
                    },
                    child: const Text("Login B")),
                ElevatedButton(
                    onPressed: () {
                      login('c@c.com');
                    },
                    child: const Text("Login C")),
                ElevatedButton(onPressed: signIn, child: const Text("Sign in")),
              ]),
        ),
      ),
    );
  }
}

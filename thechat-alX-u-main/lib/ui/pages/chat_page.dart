import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../controllers/authentication_controller.dart';

class ChatPage extends StatelessWidget {
  final List users = ["mm@h.com", "aa@hja.com", "@mma.com"];
  //ChatPage({required this.users, Key? key}) : super(key: key);
  ChatPage({Key? key}) : super(key: key);
  AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logout();
    } catch (e) {
      logError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App ${authenticationController.userEmail()}"),
        actions: [
          const IconButton(onPressed: null, icon: Icon(Icons.sailing_rounded)),
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _logout();
              }),
        ],
      ),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: const Text(
                "ChatsApp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: buildChats(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChats() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            height: 75,
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              //title: user.email,
              title: Text(user),
            ),
          );
        },
        itemCount: users.length,
      );
}

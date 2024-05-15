import 'package:feedbackapp/core/core.dart';
import 'package:feedbackapp/screens/dawer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final core = Get.find<Core>();
  TextEditingController nameediting = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter your name '),
              TextField(
                controller: nameediting,
                decoration: InputDecoration(hintText: 'enter your name'),
              ),
              GestureDetector(
                onTap: () {
                  core.username.value = nameediting.text;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage(title: 'EasyFeedBack');
                    },
                  ));
                },
                child: Text('create'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

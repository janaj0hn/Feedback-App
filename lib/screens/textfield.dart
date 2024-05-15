import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedbackapp/core/core.dart';
import 'package:feedbackapp/ui/text/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class FeedBack extends StatefulWidget {
  final String qrcode;

  const FeedBack({super.key, required this.qrcode});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final core = Get.find<Core>();
  final Firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          title: Text(
            core.projectTitle.value,
            style: Kbody,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  core.projectTitle.value,
                  style: KHeroBH,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: TextEditingController(),
                  onChanged: (value) {
                    core.myfeedback.value = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'enter your feedback here'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      child: Center(
                          child: Text(
                        'name',
                        style: Kbody,
                      )),
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal)),
                      child: Center(
                          child: Text(
                        'anonymous',
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance.collection('feedbacks').add({
                      'feedbacks': core.myfeedback.value,
                      'projectname': core.projectTitle.value,
                      'username': core.username.value,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('feedback sended')));
                  },
                  child: Text(
                    'send',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

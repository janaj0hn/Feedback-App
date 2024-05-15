import 'package:feedbackapp/core/core.dart';
import 'package:feedbackapp/ui/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFeedBackScreen extends StatefulWidget {
  const MyFeedBackScreen({super.key});

  @override
  State<MyFeedBackScreen> createState() => _MyFeedBackScreenState();
}

class _MyFeedBackScreenState extends State<MyFeedBackScreen> {
  final core = Get.find<Core>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black87),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'name: ' + core.username.value,
                        style: Kbody,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'project title: ',
                        style: Kbody,
                      ),
                      Text(
                        core.projectTitle.value,
                        style: Kbody,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'feedback: ' + core.myfeedback.value,
                        style: Kbody,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

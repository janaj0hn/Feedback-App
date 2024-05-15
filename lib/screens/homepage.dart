import 'package:feedbackapp/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final core = Get.find<Core>();
  final GlobalKey globalKey = GlobalKey();
  String qrdata = "";
  TextEditingController titleofproject = TextEditingController();
  String? projectTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Enter project title'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleofproject,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'title'),
                  onChanged: (value) {
                    setState(() {
                      qrdata = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Enter description ' + '(optional)'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'description'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Generate your qr code '),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RepaintBoundary(
                  key: globalKey,
                  child: Container(
                    child: Center(
                      child: QrImageView(
                        data: qrdata,
                        version: QrVersions.auto,
                        size: 200,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    core.projectTitle.value = titleofproject.text;
                    setState(() {
                      if (titleofproject == Characters.empty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('please enter title')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('qr is created')));
                      }
                    });
                  },
                  child: Text('create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

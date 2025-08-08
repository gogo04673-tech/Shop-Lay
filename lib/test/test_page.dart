import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/test/test_controller.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  // initInternet() async {
  //   var res = await checkInternet();
  //   print(res);
  // }

  @override
  void initState() {
    //initInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Page",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),

      body: Center(
        child: TextButton(onPressed: () {}, child: Text("Dailog")),
      ),
    );
  }
}

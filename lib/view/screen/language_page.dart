import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/language_w/customlanglist.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),

      // * body is here
      body: const CustomLangList(),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: CustomButtonContainer(
          title: "2".tr,
          onTap: () {
            Get.toNamed(AppRoute.onBoarding);
          },
        ),
      ),
    );
  }
}

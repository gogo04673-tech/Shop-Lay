import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomTitleAuth extends StatelessWidget {
  const CustomTitleAuth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontSize: 26,
        color: AppColor.primaryColor,
      ),
    );
  }
}

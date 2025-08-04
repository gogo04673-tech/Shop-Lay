import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomTextSwitch extends StatelessWidget {
  const CustomTextSwitch({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1.tr,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2.tr,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

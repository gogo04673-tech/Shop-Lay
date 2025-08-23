import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/language.dart';
import 'package:shoplay/core/localization/changelocal.dart';

class CustomLangList extends GetView<LocalController> {
  const CustomLangList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Language.languageList.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            border: BoxBorder.all(width: .2, color: AppColor.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              Language.languageList[i],
              style: const TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            trailing: Radio(
              activeColor: AppColor.primaryColor,
              value: Language.languageList[i],

              // ignore: deprecated_member_use
              groupValue: "${controller.language}",
              // ignore: deprecated_member_use
              onChanged: (value) {
                controller.changeLang(value);
              },
            ),
          ),
        );
      },
    );
  }
}

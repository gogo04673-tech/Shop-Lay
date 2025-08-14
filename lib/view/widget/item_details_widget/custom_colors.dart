import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/item_details_controller.dart';

import 'package:shoplay/core/constant/colors.dart';

class CustomColors extends StatelessWidget {
  const CustomColors({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) => Row(
        children: [
          ...List.generate(controller.colorsItem.length, (i) {
            return Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: controller.colorsItem[i]['active'] == "1"
                      ? AppColor.secondaryColor
                      : Colors.transparent,
                  width: 3,
                ),

                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(backgroundColor: Colors.red),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoplay/controller/controller_pages/item_details_controller.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomSize extends StatelessWidget {
  const CustomSize({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) => Row(
        children: [
          ...List.generate(controller.sizeItem.length, (i) {
            return Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: controller.colorsItem[i]['active'] == "1"
                    ? AppColor.secondaryColor
                    : Colors.transparent,
                border: Border.all(
                  color: controller.colorsItem[i]['active'] == "1"
                      ? AppColor.secondaryColor
                      : Colors.transparent,
                  width: 3,
                ),

                shape: BoxShape.circle,
              ),
              child: Text("${controller.sizeItem[i]['name']}".toUpperCase()),
            );
          }),
        ],
      ),
    );
  }
}

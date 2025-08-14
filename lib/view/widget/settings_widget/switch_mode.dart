import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/settings_controller.dart';
import 'package:shoplay/core/constant/colors.dart';

class SwitchMode extends StatelessWidget {
  const SwitchMode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsPageControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Dark Mode",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Switch(
            value: controller.changeMode,
            onChanged: (value) {
              controller.switchMode(value);
            },

            activeColor: AppColor.white,
            activeTrackColor: AppColor.grey,
            inactiveThumbColor: AppColor.white,
            inactiveTrackColor: AppColor.grey,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            thumbIcon: WidgetStateProperty.all(
              const Icon(Icons.circle, size: 34, color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }
}

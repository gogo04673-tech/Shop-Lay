import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class SwitchNotification extends StatelessWidget {
  const SwitchNotification({
    super.key,
    required this.valueSwitch,
    required this.onChanged,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  final bool valueSwitch;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                TextSpan(
                  text: "\n$description",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: AppColor.greyDeep),
                ),
              ],
            ),
          ),
          Switch(
            value: valueSwitch,
            onChanged: onChanged,
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

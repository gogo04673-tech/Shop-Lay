import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomChoiceAddress extends StatelessWidget {
  const CustomChoiceAddress({
    super.key,
    required this.title,
    required this.subtitle,
    required this.activeAddress,
    this.onTapAddress,
  });
  final void Function()? onTapAddress;
  final String title;
  final String subtitle;
  final bool activeAddress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAddress,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: ListTile(
        title: Text(
          title.capitalizeFirst!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0.5,
          ),
        ),
        subtitle: Text(
          subtitle.capitalizeFirst!,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),

        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.location_on_outlined, size: 26),
        ),

        trailing: activeAddress
            ? const Icon(Icons.circle, size: 18, color: AppColor.primaryColor)
            : null,
      ),
    );
  }
}

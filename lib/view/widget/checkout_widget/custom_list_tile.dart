import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomListTileCheckout extends StatelessWidget {
  const CustomListTileCheckout({
    super.key,
    required this.title,
    required this.activePayment,
    required this.image,
    this.onTapPay,
  });
  final String title;
  final String image;
  final void Function()? onTapPay;

  final bool activePayment;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapPay,
      child: ListTile(
        title: Text(
          title.capitalizeFirst!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0.5,
          ),
        ),

        leading: Image.asset(image, width: 40),

        trailing: activePayment
            ? const Icon(Icons.circle, size: 18, color: AppColor.primaryColor)
            : null,
      ),
    );
  }
}

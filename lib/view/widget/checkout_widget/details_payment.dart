import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class DetailsPayment extends StatelessWidget {
  const DetailsPayment({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(price),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class TextDetailsW extends StatelessWidget {
  const TextDetailsW({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColor.greyDeep, fontSize: 15),
          ),
          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

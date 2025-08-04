import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomBodyText extends StatelessWidget {
  const CustomBodyText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: text.length > 35 ? TextAlign.center : TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

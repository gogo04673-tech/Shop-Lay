import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({
    super.key,
    required this.title,
    required this.onTapRowPage,
  });
  final String title;
  final void Function()? onTapRowPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.grey,
      highlightColor: AppColor.grey,
      borderRadius: BorderRadius.circular(20),
      onTap: onTapRowPage,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const Text(
              "English",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

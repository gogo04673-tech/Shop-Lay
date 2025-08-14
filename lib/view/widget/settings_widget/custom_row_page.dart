import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomRowPage extends StatelessWidget {
  const CustomRowPage({
    super.key,
    required this.title,
    required this.onTapRowPage,
    this.textColor = false,
  });
  final String title;
  final void Function()? onTapRowPage;
  final bool textColor;

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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor == true ? AppColor.errorColor : AppColor.black,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 26,
              color: textColor == true ? AppColor.errorColor : AppColor.black,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomIconCount extends StatelessWidget {
  const CustomIconCount({
    super.key,
    required this.iconCount,
    required this.onTap,
  });
  final IconData iconCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 35,
        width: 35,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(iconCount, size: 18),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomReceive extends StatelessWidget {
  const CustomReceive({
    super.key,
    required this.title,
    required this.onTapReceive,
    required this.activeReceive,
  });
  final String title;
  final void Function()? onTapReceive;
  final bool activeReceive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapReceive,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        margin: const EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: activeReceive ? AppColor.secondaryColor : null,
          border: Border.all(color: AppColor.grey, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 28),
            ),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  TextSpan(
                    text: "\n$subtitle",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

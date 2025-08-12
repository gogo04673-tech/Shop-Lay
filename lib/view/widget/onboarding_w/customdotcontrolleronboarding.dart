import 'package:flutter/material.dart';

import 'package:shoplay/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key, required this.controller});
  final int controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBoardingList.length, (i) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 6,
            width: controller == i ? 20 : 6,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 99, 156, 197),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        }),
      ],
    );
  }
}

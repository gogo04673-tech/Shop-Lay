import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/data/datasource/static/static.dart';

class RowIconAnother extends StatelessWidget {
  const RowIconAnother({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(listLogoLogin.length, (i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(100),
            ),

            child: IconButton(
              onPressed: listLogoLogin[i].onPressed,

              icon: Image.asset(listLogoLogin[i].logo, width: 20),
            ),
          );
        }),
      ],
    );
  }
}

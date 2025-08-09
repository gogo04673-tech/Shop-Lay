import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.typeProducts});

  final List typeProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: typeProducts.length,
        itemBuilder: (context, i) {
          var type = typeProducts[i];
          return Container(
            margin: const EdgeInsets.only(right: 10),
            height: 10,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              type,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColor.textColor),
            ),
          );
        },
      ),
    );
  }
}

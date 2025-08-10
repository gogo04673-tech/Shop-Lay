import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, i) {
          var type = list[i];
          return InkWell(
            onTap: () {
              print("${type['categories_name']}".capitalizeFirst!);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${type['categories_name']}".capitalizeFirst!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColor.textColor),
              ),
            ),
          );
        },
      ),
    );
  }
}

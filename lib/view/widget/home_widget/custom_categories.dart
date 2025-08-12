import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/home_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/data/models/categories_m.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.list, this.onTapCategory});

  final List list;
  final void Function()? onTapCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Category(
            categoriesModel: CategoriesModel.fromJson(list[i]),
            i: i,
          );
        },
      ),
    );
  }
}

class Category extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const Category({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
          controller.categories,
          i,
          categoriesModel.categoriesId.toString(),
        );
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
          "${translateDataBase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)}"
              .capitalizeFirst!,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: AppColor.textColor),
        ),
      ),
    );
  }
}

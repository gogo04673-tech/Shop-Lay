import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/items_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/data/models/categories_m.dart';

class CustomCategoriesW extends StatelessWidget {
  const CustomCategoriesW({super.key, required this.list});

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
          return Category(
            categoriesModel: CategoriesModel.fromJson(list[i]),
            i: i,
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int i;
  const Category({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeCategory(i, categoriesModel.categoriesId.toString());
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          height: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.selectCategory == i
                ? AppColor.secondaryColor
                : AppColor.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${translateDataBase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)}", // "${categoriesModel.categoriesName}".capitalizeFirst!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColor.textColor),
          ),
        ),
      ),
    );
  }
}

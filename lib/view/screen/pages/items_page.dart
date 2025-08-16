import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/items_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/home_widget/custom_list_search.dart';
import 'package:shoplay/view/widget/items/custom_cat__w.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';
import 'package:shoplay/view/widget/tool/custom_grid_item.dart';
import 'package:shoplay/view/widget/tool/custom_search.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return Scaffold(
      appBar: const CustomAppbar(title: "Items"),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              const SizedBox(height: 20),

              CustomSearch(
                onPressedSearch: () {
                  controller.onPressedSearch();
                },
                controller: controller.search,
                onChanged: controller.onChange,
              ),

              // * Categories is here

              // * Grid View Items is here
              controller.isSearch
                  ? HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListItemSearch(list: controller.listSearch),
                    )
                  : Column(
                      children: [
                        CustomCategoriesW(list: controller.categories),

                        GetBuilder<ItemsControllerImp>(
                          builder: (controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: CustomGridItem(list: controller.items),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

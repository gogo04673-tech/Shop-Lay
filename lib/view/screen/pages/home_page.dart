import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/home_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/home_widget/custom_appbar.dart';
import 'package:shoplay/view/widget/home_widget/custom_categories.dart';
import 'package:shoplay/view/widget/home_widget/custom_grid_item.dart';
import 'package:shoplay/view/widget/home_widget/custom_list_hor.dart';
import 'package:shoplay/view/widget/home_widget/custom_search.dart';
import 'package:shoplay/view/widget/home_widget/custom_text.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return Scaffold(
      // This is AppBar Home Page
      appBar: CustomAppbar(
        title: 'Shop-Lay',
        iconLeading: Icons.notifications_none_outlined,
        iconAction: Icons.shopping_cart_outlined,
      ),

      // This is body Home Page
      body: GetBuilder<HomePageControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  // * This is TextField Search about products.
                  CustomSearch(),

                  // * This Row of type products ( All Clothing .......)
                  CustomCategories(list: controller.categories),

                  // * This is a Text title Feature Products
                  CustomText(text: "Featured Products"),

                  // * list this feature products
                  CustomListItemHor(list: controller.itemsView),

                  // * This is a Text title All Products
                  CustomText(text: "All Products"),

                  // * This Grad view about All Products
                  CustomGridItem(list: controller.items),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

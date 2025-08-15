import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/home_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';
import 'package:shoplay/view/widget/home_widget/custom_categories.dart';
import 'package:shoplay/view/widget/home_widget/custom_list_hor.dart';
import 'package:shoplay/view/widget/tool/custom_search.dart';
import 'package:shoplay/view/widget/tool/custom_text.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return Scaffold(
      // This is AppBar Home Page
      appBar: CustomAppbar(
        title: "Sop-Lay",
        iconAction: Icons.notifications_none_outlined,
        onPressedAction: () {
          Get.bottomSheet(
            Container(
              color: Colors.white,
              height: 200,
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Text(
                        "Error",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 125),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ],
                  ),

                  ListTile(
                    title: const Text("Oops! Something went wrong."),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.highlight_remove_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "We encountered an issue while processing\nyour request. Please try again.",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ), //const CustomAppbar(iconAction: Icons.notifications_none_outlined),
      // This is body Home Page
      body: GetBuilder<HomePageControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const CustomSearch(),
                    // * This Row of type products ( All Clothing .......)
                    CustomCategories(list: controller.categories),

                    // * This is a Text title Feature Products
                    const CustomText(text: "Featured Products"),

                    // * list this feature products
                    CustomListItemHor(list: controller.itemsView),

                    // * This is a Text title All Products
                    const CustomText(text: "All Products"),

                    // * This Grad view about All Products
                    // CustomGridItem(
                    //   list: controller.items,
                    //   activeFavorite: false,
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/home_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/home_widget/custom_list_search.dart';
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
    HomePageControllerImp cont = Get.put(HomePageControllerImp());

    return Scaffold(
      // This is AppBar Home Page
      appBar: CustomAppbar(
        title: "Sop-Lay",
        iconAction: Icons.notifications_none_outlined,
        onPressedAction: () {
          cont.goToNotification();
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

                    CustomSearch(
                      onPressedSearch: () {
                        controller.onPressedSearch();
                      },
                      controller: controller.search,
                      onChanged: controller.onChange,
                    ),

                    // * This Row of type products ( All Clothing .......)
                    !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCategories(list: controller.categories),

                              // * This is a Text title Feature Products
                              const CustomText(text: "Top Seller"),

                              // * list this feature products
                              CustomListItemHor(
                                list: controller.itemsTopSeller,
                              ),

                              // * This is a Text title All Products
                              const CustomText(text: "All Products"),

                              // * This Grad view about All Products
                              // CustomGridItem(
                              //   list: controller.items,
                              //   activeFavorite: false,
                              // ),
                            ],
                          )
                        : HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: ListItemSearch(list: controller.listSearch),
                          ),
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

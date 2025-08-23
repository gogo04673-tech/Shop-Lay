import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/offers_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/data/models/item_m.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      appBar: const CustomAppbar(title: "Offers"),
      body: GetBuilder<OffersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3,
              ),
              itemCount: controller.offersList.length,
              itemBuilder: (context, i) {
                ItemModel item = controller.offersList[i];
                return InkWell(
                  onTap: () {
                    controller.goToItemDetails(item);
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 217,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item.itemsDiscount}% off",
                              style: const TextStyle(color: AppColor.greyDeep),
                            ),
                            Text(
                              item.itemsName!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item.itemsDesc!,
                              style: const TextStyle(color: AppColor.greyDeep),
                            ),
                          ],
                        ),
                      ),

                      CachedNetworkImage(
                        imageUrl: "${AppLinks.itemImage}/${item.itemsImage}",
                        width: 130,
                        height: 100,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

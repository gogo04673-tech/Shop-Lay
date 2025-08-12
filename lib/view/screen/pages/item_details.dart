import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/item_details_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';
import 'package:shoplay/view/widget/tool/custom_text.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Item Details"),
      body: GetBuilder<ItemDetailsControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // image item
              Hero(
                tag: "${controller.itemModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLinks.itemImage}/${controller.itemModel.itemsImage}",
                ),
              ),

              // * Title item
              CustomText(
                text:
                    "${translateDataBase(controller.itemModel.itemsNameAr!, controller.itemModel.itemsName!)}",
              ),

              // * Favorite and value and views and /....
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Text value
                      const Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // * Star or value
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (i) => const Icon(Icons.star_border_outlined),
                          ),
                        ],
                      ),

                      // * Text Views
                      Text(
                        "${125} Reviews",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.greyDeep,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...List.generate(5, (i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "${i + 1}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                width: 180,
                                child: LinearProgressIndicator(
                                  color: AppColor.primaryColor,
                                  backgroundColor: AppColor.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  minHeight: 10,
                                  value: .2,
                                ),
                              ),

                              // Value of %
                              const Text(
                                "20%",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),

              // * This is Price
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "\$${controller.itemModel.itemsPrice}",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // Description is Here
              ),
              Text(
                "${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}",
              ),

              // Text title Color
              const CustomText(text: "Color"),

              // * Colors is here
              Row(
                children: [
                  ...List.generate(controller.colorsItem.length, (i) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.colorsItem[i]['active'] == "1"
                              ? AppColor.secondaryColor
                              : Colors.transparent,
                          width: 3,
                        ),

                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(backgroundColor: Colors.red),
                    );
                  }),
                ],
              ),

              // Text title Sized
              const CustomText(text: "Size"),

              // *  Size items is here
              Row(
                children: [
                  ...List.generate(controller.sizeItem.length, (i) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: controller.colorsItem[i]['active'] == "1"
                            ? AppColor.secondaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: controller.colorsItem[i]['active'] == "1"
                              ? AppColor.secondaryColor
                              : Colors.transparent,
                          width: 3,
                        ),

                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${controller.sizeItem[i]['name']}".toUpperCase(),
                      ),
                    );
                  }),
                ],
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // * Add to Card
      floatingActionButton: CustomButtonContainer(title: "Add Card"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

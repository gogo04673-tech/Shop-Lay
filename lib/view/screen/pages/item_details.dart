import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/item_details_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/item_details_widget/custom_colors.dart';
import 'package:shoplay/view/widget/item_details_widget/custom_size.dart';
import 'package:shoplay/view/widget/item_details_widget/favorite_views.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';
import 'package:shoplay/view/widget/tool/custom_text.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp contr = Get.put(ItemDetailsControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Item Details"),
      body: GetBuilder<ItemDetailsControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // * image item
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
              const FavoriteViews(),

              // * This is Price
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "\$${controller.itemModel.itemsPriceDiscount!.toStringAsFixed(2)}  ",
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      if (controller.itemModel.itemsDiscount != 0)
                        TextSpan(
                          text: controller.itemModel.itemsPrice!
                              .toStringAsFixed(2),
                          style: const TextStyle(
                            color: AppColor.greyDeep,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColor.greyDeep,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // * Description is Here
              Text(
                "${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}${translateDataBase(controller.itemModel.itemsDescAr!, controller.itemModel.itemsDesc!)}",
              ),

              // Text title Color
              const CustomText(text: "Color"),

              // * Colors is here
              const CustomColors(),

              // Text title Sized
              const CustomText(text: "Size"),

              // *  Size items is here
              const CustomSize(),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // * Add to Card
      floatingActionButton: CustomButtonContainer(
        title: "Add Card",
        onTap: () {
          contr.cartPageControllerImp.addItemToCart(contr.itemModel.itemsId);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

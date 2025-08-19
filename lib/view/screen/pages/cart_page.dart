import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/cart_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/cart_widget/custom_text_cart.dart';
import 'package:shoplay/view/widget/cart_widget/view_cart_items.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartPageControllerImp());

    return Scaffold(
      appBar: const CustomAppbar(title: "Cart"),
      body: GetBuilder<CartPageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ViewCartItems(
                  list: controller.cartItemsData,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: GetBuilder<CartPageControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextCart(
                  title: "Subtotal",
                  price: "\$${controller.totalPriceItems.toStringAsFixed(2)}",
                ),

                CustomTextCart(
                  title: "Discount",
                  price: "${controller.discountCoupon}%",
                ),

                const CustomTextCart(title: "Shipping", price: "\$5.00"),

                CustomTextCart(
                  title: "Total",
                  price:
                      "\$${(controller.countTotalPrice() + 5).toStringAsFixed(2)}",
                ),

                CustomButtonContainer(
                  title: "Checkout",
                  onTap: () {
                    controller.goToCheckout();
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<CartPageControllerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.only(bottom: 50, left: 14),
          alignment: Alignment.bottomCenter,
          height: 50,

          child: controller.nameCoupon == null
              ? Row(
                  children: [
                    Expanded(
                      child: CustomTextFiledForm(
                        hintText: "Coupon Code",
                        controller: controller.coupon!,
                      ),
                    ),

                    SizedBox(
                      width: 140,
                      child: CustomButtonContainer(
                        title: "Apply",
                        onTap: () {
                          controller.checkCouponRequest();
                        },
                      ),
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  child: Text("Coupon Code: ${controller.coupon!.text}"),
                ),
        ),
      ),
    );
  }
}

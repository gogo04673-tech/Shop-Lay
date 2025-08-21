import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/checkout_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/data/models/address_m.dart';
import 'package:shoplay/view/widget/checkout_widget/custom_choice_address.dart';
import 'package:shoplay/view/widget/checkout_widget/custom_list_tile.dart';
import 'package:shoplay/view/widget/checkout_widget/custom_receive.dart';
import 'package:shoplay/view/widget/checkout_widget/custom_title.dart';
import 'package:shoplay/view/widget/checkout_widget/details_payment.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutPageControllerImp con = Get.put(CheckoutPageControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Checkout"),

      // * Floating Icon
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButtonContainer(
        title: "Place Order",
        onTap: () {
          con.checkoutRequest();
        },
      ),

      // * Body is here
      body: GetBuilder<CheckoutPageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                // * Text title Receive
                const CustomTitle(title: 'Receive'),

                // * choice receive
                Row(
                  children: [
                    CustomReceive(
                      title: 'Delivery',
                      onTapReceive: () {
                        controller.choiceReceive("delivery");
                      },
                      activeReceive: controller.receive == "delivery"
                          ? true
                          : false,
                    ),
                    CustomReceive(
                      title: 'In-Stor Pickup',
                      onTapReceive: () {
                        controller.choiceReceive("in-stor pickup");
                      },
                      activeReceive: controller.receive == "in-stor pickup"
                          ? true
                          : false,
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                // * Text title Delivery address
                if (controller.receive == "delivery")
                  const CustomTitle(title: "Delivery address"),

                if (controller.receive == "delivery")
                  ...List.generate(controller.listAddresses.length, (i) {
                    AddressModel address = controller.listAddresses[i];
                    return CustomChoiceAddress(
                      title: address.addressName!,
                      subtitle:
                          '${address.addressCity} ${address.addressStreet}',
                      onTapAddress: () {
                        controller.choiceAddressId(address.addressId!);
                      },
                      activeAddress: controller.addressId == address.addressId
                          ? true
                          : false,
                    );
                  }),

                // * Text title order Summary
                // const CustomTitle(title: "Order Summary"),

                // Title payment method
                const CustomTitle(title: "Payment Method"),

                CustomListTileCheckout(
                  title: 'card',
                  activePayment: controller.payment == "card" ? true : false,
                  image: AppImageAssets.visaImage,
                  onTapPay: () {
                    controller.choicePayment("card");
                  },
                ),
                CustomListTileCheckout(
                  title: 'cash',
                  activePayment: controller.payment == "cash" ? true : false,
                  image: AppImageAssets.dollarImage,
                  onTapPay: () {
                    controller.choicePayment("cash");
                  },
                ),

                // * text title order total
                const CustomTitle(title: "Order Total"),

                // * Column details payment
                Column(
                  children: [
                    DetailsPayment(
                      title: "SubTotal",
                      price: "\$${controller.subTotal.toStringAsFixed(2)}",
                    ),
                    DetailsPayment(
                      title: "Shipping",
                      price: "\$${3.toStringAsFixed(2)}",
                    ),
                    DetailsPayment(
                      title: "Discount",
                      price: "${controller.couponDiscount}%",
                    ),
                    DetailsPayment(
                      title: "Total",
                      price:
                          "\$${controller.totalPriceOrder.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

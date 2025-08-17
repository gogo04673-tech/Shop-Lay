import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/details_address_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class DetailsAddressPage extends StatelessWidget {
  const DetailsAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsAddressControllerImp contr = Get.put(DetailsAddressControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Details Address"),
      body: GetBuilder<DetailsAddressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                CustomTextFiledForm(
                  hintText: 'Full Name',
                  controller: controller.nameAddress,
                ),

                const SizedBox(height: 20),

                CustomTextFiledForm(
                  hintText: 'City address',
                  controller: controller.cityAddress,
                ),

                const SizedBox(height: 20),

                CustomTextFiledForm(
                  hintText: 'Street address',
                  controller: controller.streetAddress,
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: CustomButtonContainer(
          title: "Save Address",
          onTap: () {
            contr.addAddressRequest();
          },
        ),
      ),
    );
  }
}

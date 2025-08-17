import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/view_address_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class ViewAddressPage extends StatelessWidget {
  const ViewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressControllerImp controllerView = Get.put(
      ViewAddressControllerImp(),
    );
    return Scaffold(
      appBar: const CustomAppbar(title: "Addresses"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controllerView.goToAddAddress();
        },

        child: const Icon(Icons.add),
      ),

      body: GetBuilder<ViewAddressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.listAddress.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(
                  "${controller.listAddress[i].addressName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),

                subtitle: Text(
                  "\n${controller.listAddress[i].addressStreet}",
                  style: const TextStyle(color: AppColor.greyDeep, height: 0.1),
                ),

                leading: Container(
                  padding: const EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.maps_home_work_outlined),
                ),

                trailing: IconButton(
                  onPressed: () {
                    controller.deleteAddressDataRequest(
                      controller.listAddress[i].addressId!,
                    );
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    size: 27,
                    color: AppColor.errorColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

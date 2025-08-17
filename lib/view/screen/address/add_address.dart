import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoplay/controller/controller_pages/add_address_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Add Address"),
      body: GetBuilder<AddAddressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  if (controller.kGooglePlex != null)
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        onTap: controller.addMarker,
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController contr) {
                          controller.controllerMap.complete(contr);
                        },
                      ),
                    ),
                ],
              ),

              Positioned(
                bottom: 10,
                child: InkWell(
                  onTap: () {
                    controller.goToAddressDetails();
                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Next"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/view_address_controller.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class ViewAddressPage extends StatelessWidget {
  const ViewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressControllerImp controllerView = Get.put(
      ViewAddressControllerImp(),
    );
    return Scaffold(
      appBar: CustomAppbar(title: "Address"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controllerView.goToAddAddress();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

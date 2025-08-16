import 'package:flutter/material.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar(title: "Add Address"));
  }
}

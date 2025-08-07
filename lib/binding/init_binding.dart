import 'package:get/get.dart';
import 'package:shoplay/core/class/crud.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

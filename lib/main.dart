import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/binding/init_binding.dart';

import 'package:shoplay/core/localization/changelocal.dart';
import 'package:shoplay/core/localization/translations.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializationService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: controller.language,
      theme: controller.appTheme, //
      getPages: routes,
      initialBinding: InitBinding(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoplay/core/localization/changelocal.dart';
import 'package:shoplay/core/localization/translations.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/route.dart';
import 'package:shoplay/test_page.dart';
import 'package:shoplay/view/screen/language_page.dart';

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
      theme: controller.appTheme,
      home: //TestPage(),
          const LanguagePage(),
      routes: routes,
    );
  }
}

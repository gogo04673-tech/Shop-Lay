import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/localization/translations.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/route.dart';
import 'package:shoplay/view/screen/onboarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializationService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: const TextStyle(
            fontFamily: "Cairo-Bold",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
          bodySmall: const TextStyle(
            fontFamily: "Cairo-Regular",
            fontSize: 13,
            height: 1.6,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const OnboardingPage(),
      routes: routes,
    );
  }
}

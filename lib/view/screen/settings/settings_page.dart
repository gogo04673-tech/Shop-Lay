import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/settings_controller.dart';
import 'package:shoplay/view/widget/settings_widget/custom_row_page.dart';
import 'package:shoplay/view/widget/settings_widget/custom_text_s.dart';
import 'package:shoplay/view/widget/settings_widget/language_settings.dart';
import 'package:shoplay/view/widget/settings_widget/switch_mode.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsPageControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Settings"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GetBuilder<SettingsPageControllerImp>(
            builder: (controller) => ListView(
              children: [
                // * This is a title Account
                const CustomTextS(title: "Account"),

                // * This is Row Edit Profile
                CustomRowPage(title: "Edit Profile", onTapRowPage: () {}),

                // * This is Row change password
                CustomRowPage(title: "Change Password", onTapRowPage: () {}),

                // * This is Title App Preference
                const CustomTextS(title: "App Preference"),

                // * This is Notification
                CustomRowPage(
                  title: "Notification",
                  onTapRowPage: () {
                    controller.goToNotifyPage();
                  },
                ),

                // * This is Notification
                LanguageSettings(title: "Language", onTapRowPage: () {}),

                // * This is Switch Mode App
                const SwitchMode(),

                // * This is Title Support
                const CustomTextS(title: "Support"),

                // * This is Row FAQ
                CustomRowPage(title: "FAQ", onTapRowPage: () {}),

                // * This is Row contact Us
                CustomRowPage(
                  title: "Contact Us",
                  onTapRowPage: () {
                    controller.goToContactUsPage();
                  },
                ),

                // * This is Title Legal
                const CustomTextS(title: "legal"),

                // * This is Row Privacy Police
                CustomRowPage(title: "Privacy Police", onTapRowPage: () {}),

                // * This is Row Terms of Service
                CustomRowPage(title: "Terms of Service", onTapRowPage: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

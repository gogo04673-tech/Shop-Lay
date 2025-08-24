import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/contact_us_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/data/models/contact_us_m.dart';
import 'package:shoplay/view/widget/contact_us_w/custom_row_info.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsControllerImp cont = Get.put(ContactUsControllerImp());
    return Scaffold(
      appBar: CustomAppbar(
        title: "Contact Us",
        iconAction: Icons.history,
        onPressedAction: () {
          cont.changeValuePage(!cont.changePage);
        },
      ),
      body: GetBuilder<ContactUsControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.changePage
              ? HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.contactUsList.length,
                    itemBuilder: (context, i) {
                      ContactUsModel data = controller.contactUsList[i];
                      return CustomRowInfo(
                        title: data.contactUsTitle!,
                        subtitle: data.contactUsBody!,
                        icon: Icons.message_outlined,
                      );
                    },
                  ),
                )
              : ListView(
                  children: [
                    // * Text filed a name
                    CustomTextFiledForm(
                      hintText: 'Title',
                      controller: controller.name,
                    ),

                    const SizedBox(height: 20),

                    // * Text filed a message
                    CustomTextFiledForm(
                      hintText: 'Message',
                      controller: controller.message,

                      maxLines: 5,
                    ),

                    const SizedBox(height: 20),

                    // * Button submit
                    CustomButtonContainer(
                      title: "Submit",
                      onTap: () {
                        controller.addContactUs();
                      },
                    ),

                    // *  Contact Information
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Contact Information",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(fontSize: 18),
                      ),
                    ),

                    // * Address row
                    const CustomRowInfo(
                      title: 'Address',
                      subtitle: '123 Main Street, town, USA',
                      icon: Icons.location_on_outlined,
                    ),

                    // * Phone row
                    const CustomRowInfo(
                      title: 'Phone',
                      subtitle: '+1 (555) 123-4567',
                      icon: Icons.phone_outlined,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomTextFiledForm extends StatefulWidget {
  const CustomTextFiledForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.stateIcon = false,
    this.maxLines = 1, // Add this
    this.minLines,
    this.prefixIcon, // Add this
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  final bool stateIcon;
  final IconData? prefixIcon;
  final int maxLines; // Add this
  final int? minLines;

  @override
  State<CustomTextFiledForm> createState() => _TextFormFiledState();
}

class _TextFormFiledState extends State<CustomTextFiledForm> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.stateIcon ? !obscureText : obscureText,
      maxLines: widget.maxLines, // Add this
      minLines: widget.minLines, // Add this
      style: const TextStyle(
        color: AppColor.textColor,
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
      cursorColor: AppColor.grey,
      decoration: InputDecoration(
        hintText: widget.hintText.tr,
        hintStyle: const TextStyle(color: Color(0xFF7393a4), fontSize: 14),
        filled: true,

        fillColor: AppColor.secondaryColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),

          borderSide: const BorderSide(color: AppColor.grey, width: 0.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColor.backgroundColor, width: 0.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:const  BorderSide(color: AppColor.grey, width: 0.3),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColor.primaryColor)
            : null,

        suffixIcon: widget.stateIcon
            ? Container(
                margin:const  EdgeInsets.only(right: 6),
                child: IconButton(
                  icon: Icon(
                    !obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF7393a4),
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}

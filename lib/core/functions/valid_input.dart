import 'package:get/get.dart';

String? validationInput(String value, String type, int min, int max) {
  // تحقق أولاً إذا كانت القيمة فارغة
  if (value.isEmpty) {
    return "This field can't be empty";
  }

  // تحقق من الطول
  if (value.length < min) {
    return "Input must be at least $min characters";
  }

  if (value.length > max) {
    return "Input must be less than or equal to $max characters";
  }

  // تحقق حسب النوع
  if (type == "username" && !GetUtils.isUsername(value)) {
    return "Not a valid username";
  }

  if (type == "email" && !GetUtils.isEmail(value)) {
    return "Not a valid email address";
  }

  if (type == "phone" && !GetUtils.isPhoneNumber(value)) {
    return "Not a valid phone number";
  }

  // إذا كان كل شيء صحيح، نرجع null
  return null;
}

import 'package:get/route_manager.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/middleware/my_middle_ware.dart';
import 'package:shoplay/test/test_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/forget_password_page.dart';
import 'package:shoplay/view/screen/auth/login_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/reset_password_page.dart';
import 'package:shoplay/view/screen/auth/signup_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/verify_check_code_page.dart';
import 'package:shoplay/view/screen/language_page.dart';
import 'package:shoplay/view/screen/onboarding_page.dart';

List<GetPage<dynamic>>? routes = [
  // * Language
  GetPage(
    name: "/",
    page: () => const LanguagePage(),
    middlewares: [MyMiddleWare()],
  ),
  //GetPage(name: "/", page: () => const TestPage()),

  // * On boarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnboardingPage()),

  // * Auth
  GetPage(name: AppRoute.signIn, page: () => const LoginPage()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpPage()),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPasswordPage(),
  ),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCodeEmailPage()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPasswordPage()),
];

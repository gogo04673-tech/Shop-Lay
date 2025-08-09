import 'package:get/route_manager.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/middleware/my_middle_ware.dart';
// ignore: unused_import
import 'package:shoplay/test/test_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/forget_password_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/verify_code_reset_pass_page.dart';
import 'package:shoplay/view/screen/auth/login_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/reset_password_page.dart';
import 'package:shoplay/view/screen/auth/signup_page.dart';
import 'package:shoplay/view/screen/auth/verify_code_signin_page.dart';
import 'package:shoplay/view/screen/pages/home_page.dart';
import 'package:shoplay/view/screen/language_page.dart';
import 'package:shoplay/view/screen/onboarding_page.dart';

List<GetPage<dynamic>>? routes = [
  // * Language
  GetPage(
    name: "/",
    page: () => const LanguagePage(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: "/", page: () => const TestPage()),

  // * On boarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnboardingPage()),

  // * Auth
  GetPage(name: AppRoute.signIn, page: () => const LoginPage()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpPage()),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPasswordPage(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignUp,
    page: () => const VerifyCodeSignUpPage(),
  ),

  GetPage(name: AppRoute.resetPassword, page: () => const ResetPasswordPage()),
  GetPage(
    name: AppRoute.verifyCodeCheckEmail,
    page: () => const VerifyCodeResetPagePage(),
  ),

  // * Home Page
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
];

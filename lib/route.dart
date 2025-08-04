import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/view/screen/auth/forget_pass/forget_password_page.dart';
import 'package:shoplay/view/screen/auth/login_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/reset_password_page.dart';
import 'package:shoplay/view/screen/auth/signup_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/verify_check_code_page.dart';
import 'package:shoplay/view/screen/onboarding_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.signIn: (context) => const LoginPage(),
  AppRoute.onBoarding: (context) => const OnboardingPage(),
  AppRoute.signUp: (context) => const SignUpPage(),
  AppRoute.forgetPassword: (context) => const ForgetPasswordPage(),
  AppRoute.verifyCode: (context) => const VerifyCodeEmailPage(),
  AppRoute.resetPassword: (context) => const ResetPasswordPage(),
};

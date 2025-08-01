import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/view/screen/auth/login_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const LoginPage(),
};

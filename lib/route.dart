import 'package:get/route_manager.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/middleware/my_middle_ware.dart';
// ignore: unused_import
import 'package:shoplay/test/test_page.dart';
import 'package:shoplay/view/screen/address/add_address.dart';
import 'package:shoplay/view/screen/address/details_address.dart';
import 'package:shoplay/view/screen/address/view_address.dart';
import 'package:shoplay/view/screen/auth/forget_pass/forget_password_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/verify_code_reset_pass_page.dart';
import 'package:shoplay/view/screen/auth/login_page.dart';
import 'package:shoplay/view/screen/auth/forget_pass/reset_password_page.dart';
import 'package:shoplay/view/screen/auth/signup_page.dart';
import 'package:shoplay/view/screen/auth/verify_code_signin_page.dart';
import 'package:shoplay/view/screen/home_screen.dart';
import 'package:shoplay/view/screen/language_page.dart';
import 'package:shoplay/view/screen/onboarding_page.dart';
import 'package:shoplay/view/screen/pages/cart_page.dart';
import 'package:shoplay/view/screen/pages/checkout_page.dart';
import 'package:shoplay/view/screen/pages/favorite_page.dart';
import 'package:shoplay/view/screen/pages/item_details.dart';
import 'package:shoplay/view/screen/pages/items_page.dart';
import 'package:shoplay/view/screen/settings/notification_page.dart';
import 'package:shoplay/view/screen/settings/settings_page.dart';

List<GetPage<dynamic>>? routes = [
  // // * Language
  GetPage(
    name: "/",
    page: () => const LanguagePage(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: "/", page: () => const CartPage()),

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
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),

  // * Items Page
  GetPage(name: AppRoute.itemsPage, page: () => const ItemsPage()),

  // * item Details Page
  GetPage(name: AppRoute.itemDetailsPage, page: () => const ItemDetailsPage()),

  // * Favorite Page
  GetPage(name: AppRoute.favoritePage, page: () => const FavoritePage()),

  // * notificationPage
  GetPage(
    name: AppRoute.notificationPage,
    page: () => const NotificationPage(),
  ),

  // * settings Page
  GetPage(name: AppRoute.settingsPage, page: () => const SettingsPage()),

  // * Cart Page
  GetPage(name: AppRoute.cartPage, page: () => const CartPage()),

  // * Checkout page
  GetPage(name: AppRoute.checkoutPage, page: () => const CheckoutPage()),

  // * Address Pages
  GetPage(name: AppRoute.addAddressPage, page: () => const AddAddressPage()),
  GetPage(name: AppRoute.viewAddressPage, page: () => const ViewAddressPage()),
  GetPage(
    name: AppRoute.addressDetailsPage,
    page: () => const DetailsAddressPage(),
  ),
];

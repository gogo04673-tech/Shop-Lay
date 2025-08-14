class AppLinks {
  // * link server
  static const String server = "https://shop-lay-php-production.up.railway.app";
  static const String serverImage =
      "https://shop-lay-php-production.up.railway.app/upload";

  // * item and categories
  static const String itemImage =
      "https://shop-lay-php-production.up.railway.app/upload/items";

  // * link test page
  static const String linkTest = "$server/test.php";

  // Auth
  static const String linkSignUp = "$server/auth/signup.php";
  static const String linkSignIn = "$server/auth/signin.php";
  static const String linkResend = "$server/auth/resend.php";
  static const String linkCheckEmail =
      "$server/auth/forget_password/check_email.php";
  static const String linkVerifyCodeSignUp = "$server/auth/verify_code.php";
  static const String linkVerifyCodeResetPass =
      "$server/auth/forget_password/verify_code_reset.php";

  static const String linkResetPass =
      "$server/auth/forget_password/reset_password.php";

  // * Home
  static const String linkHomePage = "$server/home.php";

  // * items
  static const String linkItemsPage = "$server/items/items.php";

  // * Favorite
  static const String linkFavoriteAdd = "$server/favorite/add.php";
  static const String linkFavoriteRemove = "$server/favorite/remove.php";
  static const String linkFavoriteView = "$server/favorite/view.php";
  static const String linkFavoriteDelete = "$server/favorite/delete.php";
}

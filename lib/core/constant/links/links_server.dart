class AppLinks {
  // * link server
  static const String server = "https://shop-lay-php-production.up.railway.app";

  // * link test page
  static const String linkTest = "$server/test.php";

  // Auth
  static const String linkSignUp = "$server/auth/signup.php";
  static const String linkSignIn = "$server/auth/signin.php";
  static const String linkCheckEmail =
      "$server/auth/forget_password/check_email.php";
  static const String linkVerifyCodeSignUp = "$server/auth/verify_code.php";
  static const String linkVerifyCodeResetPass =
      "$server/auth/forget_password/verify_code_reset.php";

  static const String linkResetPass =
      "$server/auth/forget_password/reset_password.php";
}

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
  static const String linkSearchPage = "$server/items/search.php";
  static const String linkOffersPage = "$server/items/offers.php";

  // * Favorite
  static const String linkFavoriteAdd = "$server/favorite/add.php";
  static const String linkFavoriteRemove = "$server/favorite/remove.php";
  static const String linkFavoriteView = "$server/favorite/view.php";
  static const String linkFavoriteDelete = "$server/favorite/delete.php";

  // * Cart
  static const String linkCartView = "$server/cart/view.php";
  static const String linkCartDelete = "$server/cart/delete.php";
  static const String linkCartAdd = "$server/cart/add.php";
  static const String linkCartCountItem = "$server/cart/get_count.php";

  // * Orders
  static const String linkCheckout = "$server/orders/checkout.php";
  static const String linkAllOrders = "$server/orders/orders.php";
  static const String linkAllCompletedOrders = "$server/orders/completed.php";
  static const String linkAllPendingOrders = "$server/orders/pending.php";
  static const String linkDetailsOrders = "$server/orders/order_details.php";
  static const String linkDeleteOrders = "$server/orders/order_delete.php";
  static const String linkRatingOrders = "$server/orders/rating.php";

  // *Coupon
  static const String linkCoupon = "$server/coupon/check_coupon.php";

  // * Notifications
  static const String linkNotify = "$server/notifications.php";

  // * Address
  static const String linkAddAddress = "$server/address/add.php";
  static const String linkDeleteAddress = "$server/address/delete.php";
  static const String linkViewAddress = "$server/address/view.php";
  static const String linkEditAddress = "$server/address/edit.php";

  // * contact Us
  static const String linkContactUsAdd = "$server/contact_us/add.php";
  static const String linkContactUsView = "$server/contact_us/view.php";
}

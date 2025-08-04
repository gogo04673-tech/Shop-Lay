import 'package:get/get.dart';
import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/data/models/login_another_m.dart';
import 'package:shoplay/data/models/onboarding_m.dart';

// * This list page onBoarding
final List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "4".tr,
    image: AppImageAssets.onBoardingImageOne,
    body: "5".tr,
  ),
  OnBoardingModel(
    title: "6".tr,
    image: AppImageAssets.onBoardingImageTwo,
    body: "7".tr,
  ),
  OnBoardingModel(
    title: "8".tr,
    image: AppImageAssets.onBoardingImageThree,
    body: "9".tr,
  ),
];

// * This list of logo login with another way
final List<LoginAnotherModel> listLogoLogin = [
  LoginAnotherModel(
    logo: AppImageAssets.googleImage,
    onPressed: () {
      print("google");
    },
  ),
  LoginAnotherModel(
    logo: AppImageAssets.facebookImage,
    onPressed: () {
      print("facebook");
    },
  ),
  LoginAnotherModel(
    logo: AppImageAssets.xImage,
    onPressed: () {
      print("x");
    },
  ),
];

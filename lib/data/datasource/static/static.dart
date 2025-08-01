import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/data/models/onboarding_m.dart';

final List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Welcome to Shoplay",
    image: ImageAssets.onBoardingImageOne,
    body:
        "Discover a new way to shop! Everything\nyou need top products at great prices,\nAll in one place.",
  ),
  OnBoardingModel(
    title: "Your Safety Is Our Priority",
    image: ImageAssets.onBoardingImageTwo,
    body:
        "Shop with confidence your personal data\nand payments are protected with\nthe latest security technology.",
  ),
  OnBoardingModel(
    title: "Shop Together, Enjoy More",
    image: ImageAssets.onBoardingImageThree,
    body:
        "Whether you're shopping for yourself or with a friend,\nShoplay makes every grocery trip easier,\nfaster, and more fun.",
  ),
];

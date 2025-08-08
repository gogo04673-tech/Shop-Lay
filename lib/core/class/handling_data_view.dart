import 'package:flutter/material.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:lottie/lottie.dart';
import 'package:shoplay/core/constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAssets.loadingImage, width: 200))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAssets.offlineImage, width: 200))
        : statusRequest == StatusRequest.servicesFailure
        ? Center(child: Lottie.asset(AppImageAssets.errorImage, width: 200))
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(AppImageAssets.noDataImage, width: 200))
        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAssets.loadingImage, width: 200))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAssets.offlineImage, width: 200))
        : statusRequest == StatusRequest.servicesFailure
        ? Center(child: Lottie.asset(AppImageAssets.errorImage, width: 200))
        : widget;
  }
}

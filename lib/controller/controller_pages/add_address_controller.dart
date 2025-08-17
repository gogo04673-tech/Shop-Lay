import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';

abstract class AddAddressController extends GetxController {
  inits();
  getCurrentPosition();
  addMarker(LatLng latLng);
  goToAddressDetails();
}

class AddAddressControllerImp extends AddAddressController {
  CameraPosition? kGooglePlex;

  final Completer<GoogleMapController> controllerMap =
      Completer<GoogleMapController>();

  late Position position;

  StatusRequest statusRequest = StatusRequest.none;

  List<Marker> markers = [];

  double? lat;
  double? long;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  inits() {
    getCurrentPosition();
  }

  @override
  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    update();
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;

    update();
  }

  @override
  goToAddressDetails() {
    Get.toNamed(
      AppRoute.addressDetailsPage,
      arguments: {'lat': lat, 'long': long},
    );
  }
}

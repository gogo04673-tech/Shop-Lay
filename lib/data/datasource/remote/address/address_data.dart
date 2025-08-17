import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class AddressData {
  late Crud crud;

  AddressData(this.crud);

  addAddressData(
    String userId,
    String addressName,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(AppLinks.linkAddAddress, {
      'userId': userId,
      'city': city,
      'street': street,
      'addressName': addressName,
      'lat': lat,
      'lang': long,
    });

    return response.fold((l) => l, (r) => r);
  }

  editAddressData(
    String addressId,
    String addressName,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(AppLinks.linkEditAddress, {
      'address': addressId,
      'city': city,
      'street': street,
      'addressName': addressName,
      'lat': lat,
      'lang': long,
    });

    return response.fold((l) => l, (r) => r);
  }

  getAddressData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkViewAddress, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteAddressData(String addressId) async {
    var response = await crud.postRequest(AppLinks.linkDeleteAddress, {
      "addressId": addressId,
    });

    return response.fold((l) => l, (r) => r);
  }
}

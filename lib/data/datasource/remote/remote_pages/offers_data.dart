import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class OffersData {
  late Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLinks.linkOffersPage, {});

    return response.fold((l) => l, (r) => r);
  }
}

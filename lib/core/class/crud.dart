import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/check_internet.dart';

class Crud {
  // post Request
  Future<Either<StatusRequest, Map<String, dynamic>>> postRequest(
    String linkRequest,
    Map<String, dynamic> dataBody,
  ) async {
    try {
      // * This post data with request.
      var response = await http.post(
        Uri.parse(linkRequest),
        body: json.encode(dataBody),
      );

      // * Check response is connect is true
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("========$data========");
        if (data['status'] == 'success') {
          return Right(data);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.servicesFailure);
      }
    } catch (_) {
      return await checkInternet() == true
          ? const Left(StatusRequest.servicesFailure)
          : const Left(StatusRequest.offlineFailure);
    }
  }
}

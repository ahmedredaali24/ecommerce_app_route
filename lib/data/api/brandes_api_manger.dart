import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import 'api_const.dart';

class BrandesApiManger {
  BrandesApiManger._();

  static BrandesApiManger? instance;

  static BrandesApiManger getInstance() {
    instance ??= BrandesApiManger._();
    return instance!;
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrandes() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.getAllBrandsApi);
      var response = await http.get(
        url,
      );
      var brandesResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandesResponse);
      } else {
        return Left(ServerError(errorMessage: brandesResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}

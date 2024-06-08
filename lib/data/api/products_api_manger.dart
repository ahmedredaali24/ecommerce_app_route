import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce_route/data/model/response/ProuductResponseDto.dart';
import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import 'api_const.dart';

class ProductsApiManger {
  ProductsApiManger._();

  static ProductsApiManger? instance;

  static ProductsApiManger getInstance() {
    instance ??= ProductsApiManger._();
    return instance!;
  }

  Future<Either<Failures, ProductResponseDto>> getProduct() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.getAllProductsApi);
      var response = await http.get(
        url,
      );
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}

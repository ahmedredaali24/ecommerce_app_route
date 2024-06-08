import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/response/AddCartResponseDto.dart';
import 'package:e_commerce_route/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce_route/data/model/response/ProuductResponseDto.dart';
import 'package:e_commerce_route/ui/utils/shared_pre.dart';
import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import 'api_const.dart';

class AddCartApiManger {
  AddCartApiManger._();

  static AddCartApiManger? instance;

  static AddCartApiManger getInstance() {
    instance ??= AddCartApiManger._();
    return instance!;
  }

  Future<Either<Failures, AddCartResponseDto>> addToCart(
      String productId) async {
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.addToCartApi);
      var token = SharedPre.getDate(key: "Token");
      var response = await http.post(url,
          body: {"productId": productId}, headers: {"token": token.toString()});
      var addToCartResponse =
      AddCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
      else {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}

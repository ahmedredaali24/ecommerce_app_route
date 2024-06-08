import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/response/AddCartResponseDto.dart';
import 'package:e_commerce_route/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce_route/data/model/response/GetCartResponseDto.dart';
import 'package:e_commerce_route/data/model/response/ProuductResponseDto.dart';
import 'package:e_commerce_route/ui/utils/shared_pre.dart';
import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import 'api_const.dart';

class GetCartApiManger {
  GetCartApiManger._();

  static GetCartApiManger? instance;

  static GetCartApiManger getInstance() {
    instance ??= GetCartApiManger._();
    return instance!;
  }

  ///getCart
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.addToCartApi);
      var token = SharedPre.getDate(key: "Token");
      var response = await http.get(url, headers: {"token": token.toString()});
      var getCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  ///deleteItemInCart

  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConst.baseUrl, "${ApiConst.addToCartApi}/$productId");
      var token = SharedPre.getDate(key: "Token");
      var response =
          await http.delete(url, headers: {"token": token.toString()});
      var deleteItemInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: deleteItemInCartResponse.message));
      } else {
        return Left(
            ServerError(errorMessage: deleteItemInCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  ///Update
  Future<Either<Failures, GetCartResponseDto>> updateInCart(
      String productId, int count) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConst.baseUrl, "${ApiConst.addToCartApi}/$productId");
      var token = SharedPre.getDate(key: "Token");
      var response = await http.put(url,
          headers: {"token": token!.toString()}, body: {"count": "$count"});
      var updateInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: updateInCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: updateInCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}

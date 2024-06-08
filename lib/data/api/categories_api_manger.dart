import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import '../model/response/LoginResponseDto.dart';
import 'api_const.dart';

class CategoriesApiManger {

  CategoriesApiManger._();

  static CategoriesApiManger? instance;

  static CategoriesApiManger getInstance() {
    instance ??= CategoriesApiManger._();
    return instance!;
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.getAllCategoriesApi);
      var response = await http.get(
        url,
      );
      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}

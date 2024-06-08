import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/GetFavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/get_fav_remote_data_sourse.dart';
import 'package:e_commerce_route/domin/repository/repository/get_fav_repo.dart';
import 'package:flutter/cupertino.dart';

class GetFavoriteRepoImpl extends GetFavoriteRepo {
  GetFavoriteRemoteDataSource getFavoriteRemoteDataSource;


  GetFavoriteRepoImpl({required this.getFavoriteRemoteDataSource});

  @override
  Future<Either<Failures, GetFavoriteResponseEntity>> getFavorite() {
    return getFavoriteRemoteDataSource.getFavorite();
  }

  @override
  Future<Either<Failures, FavoriteResponseEntity>> deleteFavorite(String productId) {
    return getFavoriteRemoteDataSource.deleteFavorite(productId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/GetFavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/get_fav_remote_data_sourse.dart';

import '../../api/fav_api_manger.dart';

class GetFavoriteRemoteDataSourceImpl extends GetFavoriteRemoteDataSource {
  FavoriteApiManger favoriteApiManger;

  GetFavoriteRemoteDataSourceImpl({required this.favoriteApiManger});

  @override
  Future<Either<Failures, GetFavoriteResponseEntity>> getFavorite() async {
    var either = await favoriteApiManger.getFavorite();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, FavoriteResponseEntity>> deleteFavorite(
      String productId) async {
    var either = await favoriteApiManger.deleteFavorite(productId);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}

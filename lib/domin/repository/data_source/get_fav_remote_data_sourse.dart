import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';

import '../../enitity/GetFavoriteresponseEntity.dart';

abstract class GetFavoriteRemoteDataSource {
  Future<Either<Failures, GetFavoriteResponseEntity>> getFavorite();
  Future<Either<Failures, FavoriteResponseEntity>> deleteFavorite(String productId);



}
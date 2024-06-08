import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/GetCartResponseEntity.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/cart_repo.dart';

import '../enitity/AddCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/get_fav_repo.dart';

class DeleteFavoriteCartUseCase {
  GetFavoriteRepo getFavoriteRepo;

  DeleteFavoriteCartUseCase({required this.getFavoriteRepo});

  Future<Either<Failures, FavoriteResponseEntity>> invoke(String productId) {
    return getFavoriteRepo.deleteFavorite(productId);
  }
}

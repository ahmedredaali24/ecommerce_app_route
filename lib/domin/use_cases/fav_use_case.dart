import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';

import '../enitity/AddCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/fav_repo.dart';

class FavoriteUseCase {
  FavoriteRepo favoriteRepo;
  FavoriteUseCase({required this.favoriteRepo});

  Future<Either<Failures, FavoriteResponseEntity>> invoke(String productId){
   return favoriteRepo.addToFavCart(productId);
  }
}
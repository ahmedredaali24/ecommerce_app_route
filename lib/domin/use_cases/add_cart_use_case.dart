import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';

import '../enitity/AddCartResponseEntity.dart';
import '../enitity/failures.dart';

class AddCartUseCase {
  AddCartRepo addCartRepo;
  AddCartUseCase({required this.addCartRepo});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId){
   return addCartRepo.addToCart(productId);
  }
}
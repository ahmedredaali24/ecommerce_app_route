import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/GetCartResponseEntity.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/cart_repo.dart';

import '../enitity/AddCartResponseEntity.dart';
import '../enitity/failures.dart';

class UpdateGetCartUseCase {
  CartRepo cartRepo;

  UpdateGetCartUseCase({required this.cartRepo});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepo.updateInCart(productId, count);
  }
}

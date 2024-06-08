import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/GetCartResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateInCart(String productId,int count);

}
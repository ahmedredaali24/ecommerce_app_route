import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/AddCartResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';

import '../../enitity/failures.dart';

abstract class AddCartRepo{
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);

}
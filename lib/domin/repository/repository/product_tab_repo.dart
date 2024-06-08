import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';

import '../../enitity/failures.dart';

abstract class ProductTabRepo{
  Future<Either<Failures, ProductResponseEntity>> getProducts();

}
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategory();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrandes();
}


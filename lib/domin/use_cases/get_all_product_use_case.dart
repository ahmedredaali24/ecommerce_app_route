import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/repository/repository/home_tab_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/product_tab_repo.dart';

import '../enitity/CategoryOrBrandResponseEntity.dart';
import '../enitity/failures.dart';

class GetAllProductUseCase {
  ProductTabRepo productTabRepo;

  GetAllProductUseCase({required this.productTabRepo});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productTabRepo.getProducts();
  }
}

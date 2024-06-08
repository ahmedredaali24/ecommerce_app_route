import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/product_tab_remote_date_source.dart';
import 'package:e_commerce_route/domin/repository/repository/product_tab_repo.dart';

class ProductTabRepoImpl implements ProductTabRepo {
  ProductTabRemoteDateSource productTabRemoteDateSource;

  ProductTabRepoImpl({required this.productTabRemoteDateSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return productTabRemoteDateSource.getProducts();
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/api/products_api_manger.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/product_tab_remote_date_source.dart';

class ProductTabRemoteDateSourceImpl implements ProductTabRemoteDateSource {
  ProductsApiManger productsApiManger;

  ProductTabRemoteDateSourceImpl({required this.productsApiManger});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await productsApiManger.getProduct();
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/AddCartResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/add_cart_date_source.dart';
import 'package:e_commerce_route/domin/repository/data_source/product_tab_remote_date_source.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/product_tab_repo.dart';

class AddCartRepoImpl implements AddCartRepo {
  AddCartDataSource addCartDataSource;

  AddCartRepoImpl({required this.addCartDataSource});

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return addCartDataSource.addToCart(productId);
  }
}

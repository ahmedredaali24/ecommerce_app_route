import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/AddCartResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/add_cart_date_source.dart';
import 'package:e_commerce_route/domin/repository/data_source/product_tab_remote_date_source.dart';
import 'package:e_commerce_route/domin/repository/repository/add_cart_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/fav_repo.dart';
import 'package:e_commerce_route/domin/repository/repository/product_tab_repo.dart';

import '../../../domin/repository/data_source/add_fav_remote_data_source.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  FavRemoteDataSource favRemoteDataSource;

  FavoriteRepoImpl({required this.favRemoteDataSource});

  @override
  Future<Either<Failures, FavoriteResponseEntity>> addToFavCart(String productId) {
    return favRemoteDataSource.addToFavCart(productId);
  }
}

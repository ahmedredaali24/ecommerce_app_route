import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/api/add_cart_api_manger.dart';
import 'package:e_commerce_route/data/api/fav_api_manger.dart';
import 'package:e_commerce_route/data/api/products_api_manger.dart';
import 'package:e_commerce_route/domin/enitity/AddCartResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/FavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/ProductResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/add_cart_date_source.dart';
import 'package:e_commerce_route/domin/repository/data_source/add_fav_remote_data_source.dart';
import 'package:e_commerce_route/domin/repository/data_source/product_tab_remote_date_source.dart';

class FavoriteDataSourceImpl implements FavRemoteDataSource {
  FavoriteApiManger favoriteApiManger;

  FavoriteDataSourceImpl({required this.favoriteApiManger});

  @override
  Future<Either<Failures, FavoriteResponseEntity>> addToFavCart(
      String productId) async {
    var either = await favoriteApiManger.addToFavorite(productId);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

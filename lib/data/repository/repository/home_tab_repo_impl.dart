import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_route/domin/repository/repository/home_tab_repo.dart';

class HomeTabRepoImpl implements HomeTabRepository {
  HomeTabRemoteDateSource homeTabRemoteDateSource;

  HomeTabRepoImpl({required this.homeTabRemoteDateSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategory() {
    return homeTabRemoteDateSource.getCategory();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrandes() {
    return homeTabRemoteDateSource.getBrandes();
  }
}

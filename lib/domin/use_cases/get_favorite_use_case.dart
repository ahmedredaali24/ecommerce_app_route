import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/GetFavoriteresponseEntity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/repository/get_fav_repo.dart';

class GetFavoriteUseCase {
  GetFavoriteRepo getFavoriteRepo;
  GetFavoriteUseCase({required this.getFavoriteRepo});

  Future<Either<Failures,GetFavoriteResponseEntity>>invoke(){
    return getFavoriteRepo.getFavorite();
  }
}
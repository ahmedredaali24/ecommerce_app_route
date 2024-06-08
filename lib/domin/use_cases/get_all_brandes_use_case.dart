import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/repository/repository/home_tab_repo.dart';

import '../enitity/CategoryOrBrandResponseEntity.dart';
import '../enitity/failures.dart';

class GetAllBrandesUseCase {
  HomeTabRepository homeTapRepository;

  GetAllBrandesUseCase({required this.homeTapRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeTapRepository.getBrandes();
  }
}

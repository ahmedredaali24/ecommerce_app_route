import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/repository/repository/auth_repository.dart';

import '../enitity/auth_result_Entity.dart';
import '../enitity/failures.dart';

class LoginUseCase{
  AuthRepositoryContract authRepository ;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String email,String password){
    return authRepository.login(email, password);
  }

}
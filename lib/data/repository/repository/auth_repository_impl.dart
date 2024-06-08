import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domin/enitity/auth_result_Entity.dart';
import 'package:e_commerce_route/domin/enitity/failures.dart';
import 'package:e_commerce_route/domin/repository/repository/auth_repository.dart';

import '../../../domin/repository/data_source/auth_remote_date_source.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDateSource remoteDateSource;

  AuthRepositoryImpl({required this.remoteDateSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return remoteDateSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return remoteDateSource.login(email, password);
  }
}

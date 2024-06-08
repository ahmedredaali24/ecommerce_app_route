import 'package:bloc/bloc.dart';
import 'package:e_commerce_route/domin/use_cases/login_use_case.dart';
import 'package:e_commerce_route/ui/auth/login_screen/cubit/states.dart';
import 'package:flutter/cupertino.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController(text: '');
  var emailController = TextEditingController(text: '');
  bool isObscure = true;

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
            (response) => emit(LoginSuccessState(authResultEntity: response)));
  }
}

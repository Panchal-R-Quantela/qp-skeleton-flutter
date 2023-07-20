import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/authentication/domain/usecases/login_user_case.dart';
import 'auth_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  LoginUserCase? loginUserCase;

  AuthCubit({this.loginUserCase}) : super(StateInitial());

  late String? userName, password;

  saveUserName(String? value) {
    userName = value;
    debugPrint("User Name :: $userName");
  }

  savePassword(String? value) {
    password = value;
    debugPrint("Password :: $password");
  }

  loginSubmit() {
    loginUserCase!
        .callCase(LoginParam(userName: userName!, password: password!))
        .listen((data) {
      data.fold((onError) {
        emit(LoginErrorState(onError.toString()));
      }, (list) {
        emit(const LoginSuccessState(msg: "Login Successfully"));
      });
    });
  }
}

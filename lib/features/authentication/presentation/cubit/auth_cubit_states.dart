import 'package:equatable/equatable.dart';

abstract class AuthCubitState extends Equatable {
  const AuthCubitState();
}

class StateInitial extends AuthCubitState {
  @override
  List<Object?> get props => [];
}

class StateLoading extends AuthCubitState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const LoginSuccessState({required this.msg});
}

class LoginErrorState extends AuthCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const LoginErrorState(this.msg);
}

import 'package:equatable/equatable.dart';

abstract class AppCubitState{
  const AppCubitState();
}

class StateInitial extends AppCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class AppThemeState extends AppCubitState {
  final bool isDarkTheme;
  const AppThemeState({required this.isDarkTheme});
}

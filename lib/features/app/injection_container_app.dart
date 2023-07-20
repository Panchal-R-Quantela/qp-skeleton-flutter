import 'package:get_it/get_it.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';

final appSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  appSl.registerFactory(
    () => AppCubit(),
  );
}

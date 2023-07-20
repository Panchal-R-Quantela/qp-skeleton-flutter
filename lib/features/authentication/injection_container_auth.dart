import 'package:get_it/get_it.dart';
import 'package:qp_skeleton_flutter/features/authentication/data/datasource/auth_local_src.dart';
import 'package:qp_skeleton_flutter/features/authentication/data/datasource/auth_local_src.impl.dart';
import 'package:qp_skeleton_flutter/features/authentication/data/repositories/auth_repositories_impl.dart';
import 'package:qp_skeleton_flutter/features/authentication/domain/usecases/login_user_case.dart';
import 'package:qp_skeleton_flutter/features/authentication/presentation/cubit/auth_cubit.dart';
import 'domain/repositories/auth_repositories.dart';

final authSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  authSl.registerFactory(
    () => AuthCubit(loginUserCase: authSl()),
  );

  // Use Cases
  authSl.registerLazySingleton(() => LoginUserCase(authSl()));

  // Repository
  authSl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authSl()));

  // Data sources
  authSl.registerLazySingleton<AuthLocalSrc>(
    () => AuthLocalSrcImpl(),
  );
}

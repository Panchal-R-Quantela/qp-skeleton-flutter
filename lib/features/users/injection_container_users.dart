
import 'package:get_it/get_it.dart';
import 'package:qp_skeleton_flutter/features/users/presentation/cubit/user_cubit.dart';

import 'data/datasource/users_local_src.dart';
import 'data/datasource/users_local_src.impl.dart';
import 'data/repositories/users_repositories_impl.dart';
import 'domain/repositories/user_repositories.dart';
import 'domain/usecases/get_user_case.dart';

final userSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  userSl.registerFactory(
    () => UserCubit(userCase: userSl()),
  );

  // Use Cases
  userSl.registerLazySingleton(() => GetUserCase(userSl()));

  // Repository
  userSl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userSl()));

  // Data sources
  userSl.registerLazySingleton<UsersLocalSrc>(
    () => UsersLocalSrcImpl(),
  );
}

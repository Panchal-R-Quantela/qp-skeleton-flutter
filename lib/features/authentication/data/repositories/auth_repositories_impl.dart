import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../domain/usecases/login_user_case.dart';
import '../datasource/auth_local_src.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthLocalSrc usersLocalSrc;

  AuthRepositoryImpl(this.usersLocalSrc);

  @override
  Stream<Either<Failure, bool>> login(LoginParam params) async* {
    try {
      var response = await usersLocalSrc.login(params);
      yield Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      yield Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    return FailureMessage(e.toString());
  }
}

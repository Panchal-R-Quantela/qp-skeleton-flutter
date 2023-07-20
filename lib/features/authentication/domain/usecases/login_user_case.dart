import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../repositories/auth_repositories.dart';

class LoginUserCase extends UseCase<bool, LoginParam> {
  AuthRepository authRepository;

  LoginUserCase(this.authRepository);

  @override
  Stream<Either<Failure, bool>> callCase(LoginParam params) {
    return authRepository.login(params);
  }
}

class LoginParam {
  String userName, password;

  LoginParam({required this.userName, required this.password});
}

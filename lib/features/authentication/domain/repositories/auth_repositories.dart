import 'package:dartz/dartz.dart';
import 'package:qp_skeleton_flutter/features/authentication/domain/usecases/login_user_case.dart';
import '../../../../core/base/base_failures.dart';

abstract class AuthRepository {
  Stream<Either<Failure, bool>> login(LoginParam params);
}

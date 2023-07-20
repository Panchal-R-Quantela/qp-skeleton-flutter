import 'package:qp_skeleton_flutter/features/authentication/domain/usecases/login_user_case.dart';

abstract class AuthLocalSrc {
  Future<bool> login(LoginParam params);
}

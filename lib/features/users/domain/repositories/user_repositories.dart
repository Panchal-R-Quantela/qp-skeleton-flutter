import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../data/models/response_model.dart';

abstract class UserRepository {
  Stream<Either<Failure, List<Result>>> getUsers(bool isBackgroundEvent);
}

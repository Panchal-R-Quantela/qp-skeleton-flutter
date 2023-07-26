import 'package:dartz/dartz.dart';
import 'package:qp_skeleton_flutter/core/base/base_failures.dart';
import '../../data/models/workflow_response.dart';

abstract class WorkFlowRepository {
  Stream<Either<Failure, WorkFlowResponse>> getResponse();
}

import 'package:dartz/dartz.dart';
import 'package:qp_skeleton_flutter/core/base/base_failures.dart';
import 'package:qp_skeleton_flutter/core/base/use_case.dart';

import '../../data/models/workflow_response.dart';
import '../repositories/work_flow_repository.dart';

class GetResponseCase extends UseCase<WorkFlowResponse, NoParams> {
  WorkFlowRepository workFlowRepository;

  GetResponseCase(this.workFlowRepository);

  @override
  Stream<Either<Failure, WorkFlowResponse>> callCase(NoParams params) {
    return workFlowRepository.getResponse();
  }
}

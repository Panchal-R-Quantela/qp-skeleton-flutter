import 'package:dartz/dartz.dart';

import 'package:qp_skeleton_flutter/core/base/base_failures.dart';

import '../../domain/repositories/work_flow_repository.dart';
import '../datasource/work_flow_local_src.dart';
import '../models/workflow_response.dart';

class WorkFlowRepositoryImpl extends WorkFlowRepository {
  WorkFlowLocalSrc localSrc;

  WorkFlowRepositoryImpl(this.localSrc);

  @override
  Stream<Either<Failure, WorkFlowResponse>> getResponse() async* {
    try {
      var response = await localSrc.getResponse();
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

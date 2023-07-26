import '../models/workflow_response.dart';

abstract class WorkFlowLocalSrc {
  Future<WorkFlowResponse> getResponse();

}

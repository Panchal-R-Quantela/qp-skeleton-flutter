import 'package:get_it/get_it.dart';

import 'data/datasource/work_flow_local_src.dart';
import 'data/datasource/work_flow_local_src_impl.dart';
import 'data/repositories/work_flow_repository_impl.dart';
import 'domain/repositories/work_flow_repository.dart';
import 'domain/usecases/get_response_case.dart';
import 'presentation/cubits/work_flow_cubit.dart';

final workflowSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  workflowSl.registerFactory(() => WorkFlowCubit());

  // Use Cases
  workflowSl.registerLazySingleton(() => GetResponseCase(workflowSl()));

  // Repository
  workflowSl.registerLazySingleton<WorkFlowRepository>(
      () => WorkFlowRepositoryImpl(workflowSl()));

  // Data sources
  workflowSl.registerLazySingleton<WorkFlowLocalSrc>(
    () => WorkFlowLocalSrcImpl(),
  );
}

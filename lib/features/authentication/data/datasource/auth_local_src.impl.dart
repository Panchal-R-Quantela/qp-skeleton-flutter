import 'package:qp_skeleton_flutter/core/retrofit/retrofit_base_events.dart';

import '../../../../core/retrofit/rest_client.dart';
import '../../domain/usecases/login_user_case.dart';
import 'auth_local_src.dart';

class AuthLocalSrcImpl extends AuthLocalSrc {
  late RestClient restClient;

  initRestClient() async {
    restClient = await RestClientEvents.initRestClient();
  }

  @override
  Future<bool> login(LoginParam params) async {
    return true;
  }
}

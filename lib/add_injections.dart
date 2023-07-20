import 'features/app/injection_container_app.dart' as appSl;
import 'features/users/injection_container_users.dart' as userSl;
import 'features/authentication/injection_container_auth.dart' as authSl;

class AddInjections {
  static injections() async {
    await appSl.init();
    await authSl.init();
    await userSl.init();
  }
}

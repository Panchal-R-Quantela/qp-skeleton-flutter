import 'features/app/injection_container_app.dart' as appSl;
/*
import 'features/authentication/injection_container_auth.dart' as authSl;
*/

class AddInjections {
  static injections() async {
    await appSl.init();
/*
    await authSl.init();
*/
  }
}

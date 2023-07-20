import 'features/app/injection_container_app.dart' as appSl;

class AddInjections {
  static injections() async {
    await appSl.init();
  }
}

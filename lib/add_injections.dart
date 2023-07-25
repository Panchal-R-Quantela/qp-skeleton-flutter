import 'features/app/injection_container_app.dart' as appSl;

class QpAddInjections {
  static injections() async {
    await appSl.init();
  }
}

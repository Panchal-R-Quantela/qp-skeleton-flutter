import 'features/workflow/injection_container.dart' as wf_sl;

class ExmAddInjections {
  static injections() async {
    await wf_sl.init();
  }
}

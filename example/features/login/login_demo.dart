import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/authentication/presentation/pages/login_page.dart';

class LoginDemo extends StatelessWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QpSkeletonLoginPage();
  }
}

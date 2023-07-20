import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/authentication/presentation/pages/login_page.dart';
import 'package:qp_skeleton_flutter/features/drawer/side_menu.dart';

import '../../constants/image_path.dart';

class LoginDemo extends StatelessWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImagePath.kOnBoardingLogo2),
            fit: BoxFit.fill,
          )),
          child: QpSkeletonLoginPage()),
    );
  }
}

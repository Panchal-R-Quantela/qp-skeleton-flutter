import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/authentication/presentation/pages/login_page.dart';
import 'package:qp_skeleton_flutter/features/drawer/side_menu.dart';
import 'package:qp_skeleton_flutter/utils/common.dart';

class LoginDemo extends StatelessWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: QpSideMenu(
          headerPath: '',
          onItemTap: (index, item) {
            Common.showToast(
                msg: "Clicked item :: $index :: ${item.toString()}");
          }),
      body: Container(
          color: Colors.green,
          /*decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImagePath.kOnBoardingLogo2),
            fit: BoxFit.fill,
          )),*/
          child: QpSkeletonLoginPage(loginHeader: "Qp Skeleton")),
    );
  }
}

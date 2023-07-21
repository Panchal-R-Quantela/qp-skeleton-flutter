import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/authentication/presentation/pages/login_page.dart';
import 'package:qp_skeleton_flutter/features/drawer/side_menu.dart';
import 'package:qp_skeleton_flutter/utils/common.dart';

import '../../routing/navigation_route.dart';
import '../../routing/route_name.dart';
import '../../utils/app_text_styles.dart';

class LoginDemo extends StatelessWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).primaryColorDark,
          child: QpSkeletonLoginPage(
            loginHeader: "Qp Skeleton",
            headerTextStyle: AppTextStyles.titleStyle(context: context),
            bodyTextStyle: AppTextStyles.bodyStyle(context: context),
            btnTextStyle: AppTextStyles.btnStyle(context: context),
            onLogin: () {
              AppNavigationRouter.instance
                  .push(NavigationRoute.getRoute(RouteName.dashboard));
            },
          )),
    );
  }
}

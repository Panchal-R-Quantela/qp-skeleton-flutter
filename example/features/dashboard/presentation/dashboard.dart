import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/dashboard/dashboard.dart';
import 'package:qp_skeleton_flutter/features/drawer/drawer_model.dart';

import '../../../routing/base_routes.dart';
import '../../../routing/navigation_route.dart';
import '../../../routing/route_name.dart';
import '../../../utils/app_text_styles.dart';

class DashboardDemo extends StatelessWidget {
  DashboardDemo({Key? key}) : super(key: key);
  final List<DrawerModel> list = [
    DrawerModel(title: "Dashboard"),
    DrawerModel(title: "Registration"),
    DrawerModel(title: "Transaction"),
    DrawerModel(title: "Task"),
    DrawerModel(title: "Documents"),
    DrawerModel(title: "Store"),
    DrawerModel(title: "Notification"),
    DrawerModel(title: "Profile"),
    DrawerModel(title: "Settings"),
    DrawerModel(title: "Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return QpSkeletonDashboard(
      drawerStyle: AppTextStyles.bodyStyle(context: context),
      onTapDrawerItem: (index, value) {
        if (value.toString() == "Registration") {
          BaseRoutes.navigateToRegistration();
        } else if (value.toString() == "Logout") {
          BaseRoutes.navigateToSplash();
        } else {
          BaseRoutes.navigateToBasePage(value.toString());
        }
      },
      drawerList: list,
    );
  }
}

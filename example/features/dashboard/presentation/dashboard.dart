import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/dashboard/dashboard.dart';
import 'package:qp_skeleton_flutter/features/drawer/drawer_model.dart';

import '../../../routing/navigation_route.dart';
import '../../../routing/route_name.dart';

class DashboardDemo extends StatelessWidget {
  const DashboardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QpSkeletonDashboard(
      onTapDrawerItem: (index, value) {
        AppNavigationRouter.instance.push(NavigationRoute.getRoute(
            RouteName.basePage,
            parameters: value.toString()));
      },
      drawerList: drawerDefaultList,
    );
  }
}

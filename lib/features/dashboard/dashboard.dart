import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/drawer/drawer_model.dart';
import 'package:qp_skeleton_flutter/features/drawer/side_menu.dart';
import 'package:qp_skeleton_flutter/utils/global_keys.dart';
import 'components/header.dart';

class QpSkeletonDashboard extends StatelessWidget {
  final Widget? child;
  final Widget? menuHeader;
  final List<DrawerModel>? drawerList;
  final Function onTapDrawerItem;

  QpSkeletonDashboard(
      {Key? key,
      this.child,
      this.menuHeader,
      this.drawerList,
      required this.onTapDrawerItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKeys.scaffoldDashBoardKey,
      drawer: QpSideMenu(
        headerPath: '',
        drawerList: drawerList,
        onItemTap: (index, value) {
          onTapDrawerItem(index, value);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              menuHeader ?? const QpHeader(),
              const SizedBox(height: 10),
              child ?? const Text("Dashboard Ui")
            ],
          ),
        ),
      ),
    );
  }
}

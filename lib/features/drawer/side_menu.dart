import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/utils/common.dart';

import '../../common_widgets/add_theme_button.dart';
import 'drawer_model.dart';

class QpSideMenu extends StatelessWidget {
  final String headerPath;
  final List<DrawerModel>? drawerList;
  final Function? onItemTap;
  final TextStyle style;

  final List<DrawerModel> _drawerDefaultList = [
    DrawerModel(title: "Dashboard"),
    DrawerModel(title: "Transaction"),
    DrawerModel(title: "Task"),
    DrawerModel(title: "Documents"),
    DrawerModel(title: "Store"),
    DrawerModel(title: "Notification"),
    DrawerModel(title: "Profile"),
    DrawerModel(title: "Settings"),
  ];

  QpSideMenu(
      {Key? key,
      required this.headerPath,
      this.drawerList,
      this.onItemTap,
      required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: headerPath != ""
                ? Image.asset(headerPath)
                : Image.network(
                    'https://img.freepik.com/free-vector/gradient-network-connection-background_23-2148874050.jpg'),
          ),
          const QpThemeToggle(),
          ..._buildTiles(drawerList ?? _drawerDefaultList, style),
        ],
      ),
    );
  }

  List<Widget> _buildTiles(List<DrawerModel> drawerList, TextStyle? style) {
    List<Widget> tiles = [];
    for (var data in drawerList) {
      tiles.add(DrawerListTile(
        style: style,
        title: data.title,
        svgSrc: "",
        press: () {
          final index = drawerList.indexOf(data);
          debugPrint("index :: $index --> item :: ${data.title}");
          if (onItemTap != null) {
            onItemTap!(index, data);
          }
          Common.closeDrawer();
        },
      ));
    }

    return tiles;
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.style,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style: style,
      ),
    );
  }
}

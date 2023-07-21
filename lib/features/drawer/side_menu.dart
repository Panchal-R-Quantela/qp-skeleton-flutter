import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/utils/common.dart';

import 'drawer_model.dart';

class SideMenu extends StatelessWidget {
  final String headerPath;
  final List<DrawerModel>? drawerList;
  final Function? onItemTap;

  SideMenu(
      {Key? key, required this.headerPath, this.drawerList, this.onItemTap})
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
          ..._buildTiles(drawerList ?? drawerDefaultList),
        ],
      ),
    );
  }

  List<Widget> _buildTiles(List<DrawerModel> drawerList) {
    List<Widget> tiles = [];
    for (var data in drawerList) {
      tiles.add(DrawerListTile(
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
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: const Icon(Icons.add),
      title: Text(
        title,
      ),
    );
  }
}

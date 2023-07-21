import 'package:flutter/material.dart';

import '../../../utils/common.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Common.openDrawer();
          },
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}

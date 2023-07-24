import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/common_widgets/text_widgets.dart';

class QpBasePage extends StatelessWidget {
  final String title;

  QpBasePage({Key? key, this.title = "Title"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(child: QpTitleTextBlackWidget("Welcome to $title")),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCardViewWidget extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color? color;
  final double cardShape;

  CustomCardViewWidget(
      {Key? key,
      required this.child,
      this.elevation = 2.0,
      this.color,
      this.cardShape = 25.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).cardColor,
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cardShape),
          borderSide:
              BorderSide(color: Theme.of(context).cardColor.withAlpha(5))),
      child: child,
    );
  }
}

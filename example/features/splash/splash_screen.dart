import 'dart:async';
import 'package:flutter/material.dart';
import '../../routing/base_routes.dart';
import '../../routing/navigation_route.dart';
import '../../routing/route_name.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      BaseRoutes.navigateToLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}

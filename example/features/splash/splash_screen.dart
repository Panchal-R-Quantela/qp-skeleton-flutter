import 'dart:async';
import 'package:flutter/material.dart';
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
      AppNavigationRouter.instance
          .push(NavigationRoute.getRoute(RouteName.loginPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}

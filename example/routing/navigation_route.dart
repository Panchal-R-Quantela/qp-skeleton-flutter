import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/features/dashboard/base_page.dart';
import '../features/dashboard/presentation/dashboard.dart';
import '../features/login/presentation/widgets/login_demo.dart';
import '../features/login/presentation/widgets/registration.dart';
import '../features/splash/splash_screen.dart';
import '../features/workflow/presentation/widgets/client_details.dart';
import '../features/workflow/presentation/widgets/dynamic_route.dart';
import '../features/workflow/presentation/widgets/land_details.dart';
import '../features/workflow/presentation/widgets/payment_details.dart';
import '../features/workflow/presentation/widgets/registration_approval.dart';
import '../features/workflow/presentation/widgets/registration_list.dart';
import 'route_name.dart';

class NavigationRoute {
  /* static Route<dynamic>? getRoute(RouteSettings settings) {
    if (settings.name == RouteName.initialRoute) {
      return _buildRoute(settings, SplashScreen());
    } else if (settings.name == RouteName.loginPage) {
      return _buildRoute(settings, const LoginPage());
    } else if (settings.name == RouteName.homePage) {
      return _buildRoute(settings, const MyHomePage());
    } else {
      return null;
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }*/
  static Route<dynamic> getRoute(String name, {dynamic parameters}) {
    if (name == RouteName.initialRoute) {
      return _buildRoute(name, SplashScreen());
    } else if (name == RouteName.loginPage) {
      return _buildRoute(name, const LoginDemo());
    } else if (name == RouteName.dashboard) {
      return _buildRoute(name, DashboardDemo());
    } else if (name == RouteName.basePage) {
      return _buildRoute(name, QpBasePage(title: parameters));
    } else if (name == RouteName.registration) {
      return _buildRoute(name, const Registration());
    } else if (name == RouteName.clientDetails) {
      return _buildRoute(name,  ClientDetailsPage());
    } else if (name == RouteName.landDetails) {
      return _buildRoute(name,  LandDetailsPage());
    } else if (name == RouteName.paymentDetails) {
      return _buildRoute(name, const PaymentDetailsPage());
    } else if (name == RouteName.registrationApproval) {
      return _buildRoute(name, const RegistrationApprovalPage());
    } else if (name == RouteName.registrationList) {
      return _buildRoute(name,  RegistrationListPage());
    } else if (name == RouteName.dynamicRoute) {
      return _buildRoute(name, const DynamicRoutePage());
    } else {
      return _buildRoute(name, SplashScreen());
    }
  }

  static MaterialPageRoute _buildRoute(String routeName, Widget builder) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (ctx) => builder,
    );
  }
}

class AppNavigationRouter {
  // Singleton setup: prevents multiple instances of this class.
  factory AppNavigationRouter() => _router;

  AppNavigationRouter._();

  static final AppNavigationRouter _router = AppNavigationRouter._();

  static AppNavigationRouter get instance => _router;

  /// Key so we can navigate without context.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T>(Route<T> route) async {
    return navigatorKey.currentState?.push(route);
  }

  Future<T?> pushReplacement<T extends Object>(Route<T> route) async {
    return navigatorKey.currentState?.pushReplacement(route);
  }

  Future<T?> popAndPushNamed<T>(Route<T> route) async {
    return navigatorKey.currentState?.popAndPushNamed(route.settings.name!);
  }

  Future<T?> pushAndRemoveUntil<T>(
    Route<T> route, {
    String? untilRoute,
  }) async {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      route,
      (Route<dynamic> _route) {
        return false;
        //return untilRoute == _route.settings.name;
      },
    );
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String route) {
    return navigatorKey.currentState?.popUntil(ModalRoute.withName(route));
  }

  /// Page route builder with forced fade in / out transition.
  static PageRouteBuilder<Widget> fadeTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Page route builder with forced slide in from top
  static PageRouteBuilder<Widget> fromTopTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

import 'navigation_route.dart';
import 'route_name.dart';

class BaseRoutes {
  static navigateToLogin() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.loginPage));
  }

  static navigateToDashboard() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.dashboard));
  }

  static navigateToBasePage(String title) {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.basePage, parameters: title));
  }

  static navigateToSplash() {
    AppNavigationRouter.instance
        .pushAndRemoveUntil(NavigationRoute.getRoute(RouteName.loginPage));
  }

  static navigateToRegistration() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.registration));
  }

  /*Work flow*/
  static navigateToClientDetails() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.clientDetails));
  }

  static navigateToLandDetails() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.landDetails));
  }

  static navigateToPaymentDetails() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.paymentDetails));
  }

  static navigateToRegApproval() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.registrationApproval));
  }
  static navigateToRegistrationList() {
    AppNavigationRouter.instance.popUntil(RouteName.registration);
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.registrationList));
  }

  static navigateToDynamicRoute() {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(RouteName.dynamicRoute));
  }


  static navigateToWorkFlowRoute(String routeName) {
    AppNavigationRouter.instance
        .push(NavigationRoute.getRoute(routeName));
  }
}

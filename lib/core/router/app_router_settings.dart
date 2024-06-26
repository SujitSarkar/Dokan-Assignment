part of 'router_imports.dart';

class GeneratedRoute {
  static PageRouteBuilder onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.initializer:
        return PageRouteBuilder(
            settings: settings,
            transitionsBuilder: fadeTransition,
            pageBuilder: (_, animation, secondaryAnimation) =>
                const LoginScreen());

      case AppRouter.navBar:
        return PageRouteBuilder(
            settings: settings,
            transitionsBuilder: fadeTransition,
            pageBuilder: (_, animation, secondaryAnimation) =>
                const NavBarScreen());

      case AppRouter.signup:
        return PageRouteBuilder(
            settings: settings,
            transitionsBuilder: slideTransition,
            pageBuilder: (_, animation, secondaryAnimation) =>
                const Signupcreen());

      default:
        return PageRouteBuilder(
            settings: settings,
            transitionsBuilder: fadeTransition,
            pageBuilder: (_, animation, secondaryAnimation) =>
                const LoginScreen());
    }
  }

  ///Fade Page Transition
  static Widget fadeTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  ///Slide Page Transition
  static Widget slideTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(1, 0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

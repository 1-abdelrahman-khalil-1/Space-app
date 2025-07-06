import 'package:go_router/go_router.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Features/Home/presentation/view/home.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/news_screen.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/planet_description.dart';
import 'package:space_app/Features/Splash%20Screen/view/splash_screen.dart';

abstract class Approuter {
  static const String home = "/home";
  static const String planet_description = "/planet-description";
  static const String news = "/news";
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: home,
      builder: (context, state) {
        return const Home();
      },
    ),
    GoRoute(
      path: planet_description,
      builder: (context, state) {
        return PlanetDescription(
          planet: state.extra as Planet,
        );
      },
    ),
    GoRoute(
      path: news,
      builder: (context, state) {
        return const NewsScreen(); // Replace with your news screen widget
      },
    ),
  ]);
}

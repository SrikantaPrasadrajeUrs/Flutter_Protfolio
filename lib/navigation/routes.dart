import 'package:go_router/go_router.dart';
import 'package:srikanta_protfolio/screens/home/home_page.dart';
import 'package:srikanta_protfolio/screens/splash/splash_screen.dart';

class MyRoutes{
  static GoRouter routes=GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/',builder: (context,state)=>const SplashScreen()),
      GoRoute(path: '/home',builder: (context,state)=>const HomePage()),
    ],
  );
}
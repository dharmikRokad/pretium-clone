import 'package:go_router/go_router.dart';
import 'app_routes.dart';

import 'package:myapp/features/auth/code_verification_screen.dart';
import 'package:myapp/features/auth/login_screen.dart';
import 'package:myapp/features/auth/register_screen.dart';
import 'package:myapp/features/home/home_screen.dart';
import 'package:myapp/features/on_boarding/on_boarding_screen.dart';
import 'package:myapp/features/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onborad.path,
      name: AppRoutes.onborad.name,
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup.path,
      name: AppRoutes.signup.name,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.codeVerification.path,
      name: AppRoutes.codeVerification.name,
      builder: (context, state) => const CodeVerificationScccreen(),
    ),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) => const HommeScreen(),
    ),
  ],
);

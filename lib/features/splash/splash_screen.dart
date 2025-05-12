import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_assets.dart';
import 'package:myapp/core/app_colors.dart';
import 'package:myapp/core/route/app_routes.dart';
import 'package:myapp/core/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _initTimer());
  }

  _initTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      context.goNamed(
        SharedPrefs.i.isLoggedIn ? AppRoutes.home.name : AppRoutes.onborad.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset(ImageAssets.i.logo)),
    );
  }
}

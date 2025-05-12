import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_colors.dart';
import 'package:myapp/core/route/app_routes.dart';
import 'package:myapp/core/widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, WormEffect, ExpandingDotsEffect;

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _controller = PageController(initialPage: 0);

  final ValueNotifier<int> _currentIndexListenable = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndexListenable,
      builder: (context, index, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            actions: [
              if (index == 2)
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
            ],
          ),

          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) => _currentIndexListenable.value = i,
                  children: [
                    _buildOnBoardTile(
                      context,
                      Icons.credit_card,
                      "Direct Pay",
                      "Pay with crypto acress africa effortlessely",
                    ),
                    _buildOnBoardTile(
                      context,
                      Icons.credit_card,
                      "Direct Pay",
                      "Pay with crypto acress africa effortlessely",
                    ),
                    _buildOnBoardTile(
                      context,
                      Icons.receipt_long,
                      "Pay Bills",
                      "Pay for utility services and earn rewards",
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: ExpandingDotsEffect(),
                onDotClicked:
                    (i) => _controller.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    ),
              ),
            ],
          ),








































































































































































































































































































































































































































































          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: AppButton(
                onPressed: () {
                  if (index == 2) {
                    context.goNamed(AppRoutes.signup.name);
                    return;
                  }

                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
                title: index == 2 ? "Get Started" : "Next",
              ),
            ),
          ),
        );
      },
    );
  }

  _buildOnBoardTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Column(
      spacing: 20,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.secondary,
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox.shrink(),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

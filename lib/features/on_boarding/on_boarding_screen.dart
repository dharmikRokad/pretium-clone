import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_colors.dart';
import 'package:myapp/core/route/app_routes.dart';
import 'package:myapp/core/widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, ExpandingDotsEffect;

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _controller = PageController(initialPage: 0);

  final ValueNotifier<int> _currentIndexListenable = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> onBoardData = [
      {
        'icon': Icons.credit_card,
        "title": "Direct Pay",
        "desc": "Pay with crypto acress africa effortlessely",
      },
      {
        'icon': Icons.account_balance_wallet,
        "title": "Accept Payments",
        "desc": "Accept stablecoin payments hassle free",
      },
      {
        'icon': Icons.receipt_long,
        "title": "Pay Bills",
        "desc": "Pay for utility services and earn rewards",
      },
    ];

    return ValueListenableBuilder(
      valueListenable: _currentIndexListenable,
      builder: (context, index, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            actions: [
              if (index != 2)
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
                  children:
                      onBoardData
                          .map(
                            (e) => _buildOnBoardTile(
                              context,
                              e['icon'],
                              e['title'],
                              e['desc'],
                            ),
                          )
                          .toList(),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: onBoardData.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.secondary,
                ),
                onDotClicked: (i) {
                  _currentIndexListenable.value = i;
                  _controller.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ],
          ),

          bottomNavigationBar: BottomAppBar(
            color: AppColors.transparent,
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

  Widget _buildOnBoardTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.secondary,
            child: Icon(icon, color: AppColors.primary, size: 50),
          ),
          const SizedBox.shrink(),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.black54),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/route/app_routes.dart' show AppRoutes;
import 'package:myapp/core/widgets/app_button.dart';
import 'package:myapp/core/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMeNotifier = ValueNotifier<bool>(false);
  final passwordVisibleNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: const Color(0xFF0F634D),
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Welcome text
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Email input field
              AppTextField(
                controller: emailcontroller,
                hintText: 'Email',
                prefix: Icon(Icons.email_outlined),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Password input field
              ValueListenableBuilder<bool>(
                valueListenable: passwordVisibleNotifier,
                builder: (context, passwordVisible, _) {
                  return AppTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefix: Icon(Icons.lock_outline),
                    suffix: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed:
                          () =>
                              passwordVisibleNotifier.value = !passwordVisible,
                    ),
                  );
                  return TextField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            () =>
                                passwordVisibleNotifier.value =
                                    !passwordVisible,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Remember me and Forgot Password row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember me checkbox
                  ValueListenableBuilder<bool>(
                    valueListenable: rememberMeNotifier,
                    builder: (context, rememberMe, _) {
                      return Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged:
                                (value) =>
                                    rememberMeNotifier.value = value ?? false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const Text('Remember me'),
                        ],
                      );
                    },
                  ),

                  // Forgot password button
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: const Color(0xFF0F634D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Login button
              AppButton(onPressed: () {}, title: "Login"),
              const SizedBox(height: 24),

              // Sign up row
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Sign Up',
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRoutes.signup.name);
                            },
                      style: TextStyle(
                        color: const Color(0xFF0F634D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

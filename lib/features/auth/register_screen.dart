import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/core/widgets/app_button.dart';
import 'package:myapp/core/widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final termsAcceptedNotifier = ValueNotifier<bool>(false);
  final passwordVisibleNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Title
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                'Simplify your crypto payments with us',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),

              // First Name field
              AppTextField(
                controller: fNameController,
                hintText: "First Name",
                prefix: Icon(Icons.person_outline),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'First Name',
              //     prefixIcon: const Icon(Icons.person_outline),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide.none,
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
              //   ),
              // ),
              const SizedBox(height: 16),

              // Last Name field
              AppTextField(
                controller: lNameController,
                hintText: "Last Name",
                prefix: Icon(Icons.person_outline),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Last Name',
              //     prefixIcon: const Icon(Icons.person_outline),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide.none,
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
              //   ),
              // ),
              const SizedBox(height: 16),

              // Email field
              AppTextField(
                controller: emailController,
                hintText: "Email",
                prefix: Icon(Icons.email_outlined),
              ),
              // TextField(
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     prefixIcon: const Icon(Icons.email_outlined),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide.none,
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
              //   ),
              // ),
              const SizedBox(height: 16),

              // Password field
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
                  // return TextField(
                  //   obscureText: !passwordVisible,
                  //   decoration: InputDecoration(
                  //     hintText: 'Password',
                  //     prefixIcon: const Icon(Icons.lock_outline),
                  //     suffixIcon: IconButton(
                  //       icon: Icon(
                  //         passwordVisible
                  //             ? Icons.visibility
                  //             : Icons.visibility_off,
                  //       ),
                  //       onPressed:
                  //           () =>
                  //               passwordVisibleNotifier.value =
                  //                   !passwordVisible,
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 16),

              // Terms and Conditions checkbox
              ValueListenableBuilder<bool>(
                valueListenable: termsAcceptedNotifier,
                builder: (context, termsAccepted, _) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: termsAccepted,
                          onChanged:
                              (value) =>
                                  termsAcceptedNotifier.value = value ?? false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Handle terms link tap
                        },
                        child: Text(
                          'Accept Terms and Conditions',
                          style: TextStyle(color: const Color(0xFF0F634D)),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),

              // Create Account button
              AppButton(onPressed: () {}, title: 'Create Account'),

              // SizedBox(
              //   width: double.infinity,
              //   height: 56,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Handle registration with collected data
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFF0F634D),
              //       foregroundColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: const Text(
              //       'Create Account',
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 24),

              // Login link
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: const Color(0xFF0F634D),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/feartures/presentation/pages/auth_gradian_button.dart';
import 'package:blog_app/feartures/presentation/widgest/auth_field.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart'; // Nhập trang SignupPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // Chỉnh sửa route để điều hướng đến LoginPage
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 30),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              const AuthGradientButton(
                buttonText: 'Login',
              ),
              const SizedBox(height: 20),
              _buildSignUpText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Login.',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Điều hướng đến trang đăng ký
        Navigator.push(
          context,
          SignupPage.route(),
        );
      },
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
          ),
          children: [
            const TextSpan(text: 'Don\'t have an account? '),
            TextSpan(
              text: 'Sign Up',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

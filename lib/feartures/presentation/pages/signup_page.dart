import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/feartures/presentation/pages/auth_gradian_button.dart';
import 'package:blog_app/feartures/presentation/pages/login_page.dart';
import 'package:blog_app/feartures/presentation/widgest/auth_field.dart';
import 'package:blog_app/feartures/presentation/bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  // Chỉnh sửa route để điều hướng đến LoginPage
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => const SignupPage());

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                hintText: "Name",
                controller: nameController,
              ),
              const SizedBox(height: 15),
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
              AuthGradientButton(
                buttonText: 'Sign Up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                     AuthSignUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim(),
        ),);
                  }
                },
              ),
              const SizedBox(height: 20),
              _buildSignInText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Sign Up.',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSignInText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Chuyển hướng đến LoginPage
        Navigator.push(
          context,
          LoginPage.route(),
        );
      },
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
          ),
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Sign in',
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

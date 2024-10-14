import 'package:blog_app/feartures/presentation/pages/auth_gradian_button.dart';
import 'package:blog_app/feartures/presentation/widgest/auth_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(  // Thay Column thành Padding
        padding: EdgeInsets.all(16.0), // Thêm khoảng cách cho Padding
        child: Column( // Giữ Column bên trong Padding
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signup.',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 30),
            AuthField(hintText: "Name"),
           const SizedBox(height: 15),
            AuthField(hintText: "Email"),
          const  SizedBox(height: 15),
            AuthField(hintText: "Password"),
             const SizedBox(height: 20),
             AuthGradianButton(),

          ],
        ),
      ),
    );
  }
}

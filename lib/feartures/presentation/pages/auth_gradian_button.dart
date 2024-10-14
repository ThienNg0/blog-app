import 'package:flutter/material.dart';

class AuthGradianButton extends StatelessWidget {
  const AuthGradianButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text('Sign up') ,style: ElevatedButton.styleFrom(
      fixedSize: const Size(395, 55),

      ),
    );
  }
}
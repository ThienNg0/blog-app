import 'package:flutter/material.dart';

// AuthField widget
class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
 final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) => value == null || value.isEmpty ? 'Please enter $hintText' : null,
      obscureText: isObscureText,
      
    );
  }
}
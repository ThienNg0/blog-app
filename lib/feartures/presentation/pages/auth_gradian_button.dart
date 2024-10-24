import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const AuthGradientButton({super.key,required this.buttonText,required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12), // Đảm bảo bo tròn khi nhấn
      onTap: () {
        // Xử lý sự kiện khi nhấn vào button
        
      },
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppPallete.gradient1,
              AppPallete.gradient2,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(40), // Bo tròn viền button
        ),
        child: Container(
          alignment: Alignment.center,
          width: 395,
          height: 55,
          child:  Text(
            buttonText,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white, // Màu chữ trắng để nổi bật trên gradient
            ),
          ),
        ),
      ),
    );
  }
}

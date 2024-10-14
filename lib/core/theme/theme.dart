import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _borderRadius([Color color = AppPallete.borderColor]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color, // Màu đường viền của ô nhập liệu
        width: 3, // Độ rộng của đường viền
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)), // Bo tròn góc viền
    );
  }

  static final drakThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor, // Màu nền của Scaffold
    inputDecorationTheme: InputDecorationTheme( // Theme cho InputField
      contentPadding: const EdgeInsets.all(27), // Khoảng cách giữa nội dung và viền
      enabledBorder: _borderRadius(), // Đường viền khi ô không được chọn
      focusedBorder: _borderRadius(AppPallete.gradient2), // Đường viền khi ô được chọn
      errorBorder: _borderRadius(Colors.red), // Đường viền khi có lỗi
      focusedErrorBorder: _borderRadius(Colors.red), // Đường viền khi có lỗi và đang focus
    ),
  );
}

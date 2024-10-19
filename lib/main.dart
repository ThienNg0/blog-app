import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/feartures/presentation/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Supabase.initialize(
      url: AppSecrets.supbaseUrl,
      anonKey: AppSecrets.supbaseAnnonKey,
    );
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing Supabase: $e');
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.drakThemeMode,
      home: const LoginPage(),
    );
  }
}


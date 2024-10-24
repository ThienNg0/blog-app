import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/feartures/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/feartures/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/feartures/domain/usecase/user_sign_up.dart';
import 'package:blog_app/feartures/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/feartures/presentation/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final supabase = await Supabase.initialize(
      url: AppSecrets.supbaseUrl,
      anonKey: AppSecrets.supbaseAnnonKey,
    );

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(  
              userSignUp: UserSignUp(
                AuthRepositoryImpl(
                  AuthRemoteDataSourceImpl(supabase.client),
                ),
              ),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
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

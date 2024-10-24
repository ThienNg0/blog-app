import 'package:blog_app/feartures/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:blog_app/core/error/failures.dart';

class UserSignUp {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    debugPrint('Calling signUpWithEmailPassword with email: ${params.email}');
    final result = await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
    debugPrint('signUpWithEmailPassword result: $result');
    return result;
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}

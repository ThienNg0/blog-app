import 'package:fpdart/fpdart.dart';
import 'package:blog_app/core/error/failure.dart';

// This interface defines the methods for the authentication repository
abstract interface class AuthRepository {
  // Method for signing up with email and password
  Either<Failure, String> signUpWithEmailPassword({
    required String email,
    required String password,
  });
}
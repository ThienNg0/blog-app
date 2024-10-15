import 'package:fpdart/fpdart.dart';
import 'package:blog_app/core/error/failures.dart';

// This interface defines the methods for the authentication repository
abstract interface class AuthRepository {
  // Method for signing up with email and password
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
 Future<Either<Failure,String>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  
}
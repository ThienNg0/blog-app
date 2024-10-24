import 'package:blog_app/feartures/domain/usecase/user_sign_up.dart'; // Ensure this import is correct
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());

      final result = await _userSignUp(UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));

      result.fold(
        (failure) {
          debugPrint('Sign-up failed: ${failure.message}');
          emit(AuthFailure(failure.message));
        },
        (uid) {
          debugPrint('Sign-up successful, user ID: $uid');
          emit(AuthSuccess(uid));
        },
      );
    });
  }
}
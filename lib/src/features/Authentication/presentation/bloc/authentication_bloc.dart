import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  String? email;
  String? password;

  AuthenticationBloc() : super(SignInInitial()) {
    on<SignInEmailChanged>((event, emit) {
      email = event.email;
    });

    on<SignInPasswordChanged>((event, emit) {
      password = event.password;
    });

    on<SignInSubmitted>((event, emit) async {
      emit(SignInLoading());
      try {
        // Simulate login or call your authentication logic
        await Future.delayed(Duration(seconds: 2));
        // If success
        emit(SignInSuccess());
      } catch (e) {
        // If error occurs
        emit(SignInFailure('An error occurred while signing in'));
      }
    });
  }
}

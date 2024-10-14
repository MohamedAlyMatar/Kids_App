abstract class AuthenticationState {}

class SignInInitial extends AuthenticationState {}

class SignInLoading extends AuthenticationState {}

class SignInSuccess extends AuthenticationState {}

class SignInFailure extends AuthenticationState {
  final String error;
  SignInFailure(this.error);
}

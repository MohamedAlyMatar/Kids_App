abstract class AuthenticationEvent {}

class SignInEmailChanged extends AuthenticationEvent {
  final String? email;
  SignInEmailChanged(this.email);
}

class SignInPasswordChanged extends AuthenticationEvent {
  final String? password;
  SignInPasswordChanged(this.password);
}

class SignInSubmitted extends AuthenticationEvent {}

// // part of 'authentication_bloc.dart';

// import 'package:equatable/equatable.dart';

// abstract class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();

//   @override
//   List<Object> get props => [];
// }

// class SignInEvent extends AuthenticationEvent {
//   final String email;
//   final String password;

//   const SignInEvent({required this.email, required this.password});

//   @override
//   List<Object> get props => [email, password];
// }

// class SignUpEvent extends AuthenticationEvent {
//   final String email;
//   final String password;

//   const SignUpEvent({required this.email, required this.password});

//   @override
//   List<Object> get props => [email, password];
// }

// class ForgotPasswordEvent extends AuthenticationEvent {
//   final String email;

//   const ForgotPasswordEvent({required this.email});

//   @override
//   List<Object> get props => [email];
// }

import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

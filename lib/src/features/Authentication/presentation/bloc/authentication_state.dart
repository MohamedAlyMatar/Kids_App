// // part of 'authentication_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:kids_app/src/features/Authentication/domain/entities/user.dart';

// abstract class AuthenticationState extends Equatable {
//   const AuthenticationState();

//   @override
//   List<Object> get props => [];
// }

// class AuthenticationInitial extends AuthenticationState {}

// class AuthenticationLoading extends AuthenticationState {}

// class Authenticated extends AuthenticationState {
//   final User user;

//   const Authenticated({required this.user});

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticationError extends AuthenticationState {
//   final String message;

//   const AuthenticationError({required this.message});

//   @override
//   List<Object> get props => [message];
// }

// class PasswordResetSuccess extends AuthenticationState {}

import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

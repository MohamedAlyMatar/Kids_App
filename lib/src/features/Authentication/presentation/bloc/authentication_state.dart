abstract class AuthenticationState {}

// Sign In States
class SignInInitial extends AuthenticationState {}

class SignInLoading extends AuthenticationState {}

class SignInSuccess extends AuthenticationState {}

class SignInFailure extends AuthenticationState {
  final String error;
  SignInFailure(this.error);
}

// Sign Up States
class SignUpInitial extends AuthenticationState {}

class SignUpLoading extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {}

class SignUpFailure extends AuthenticationState {
  final String error;
  SignUpFailure(this.error);
}

// class AuthenticationStateWithBooleans extends AuthenticationState {
//   final bool? dldStatus;
//   final bool? hearingLossStatus;
//   final bool? pdStatus;
//   final bool? sliStatus;
//   final bool? otherStatus;

//   AuthenticationStateWithBooleans({
//     this.dldStatus,
//     this.hearingLossStatus,
//     this.pdStatus,
//     this.sliStatus,
//     this.otherStatus,
//   });

//   // Implement copyWith to update specific fields without affecting others
//   AuthenticationStateWithBooleans copyWith({
//     bool? dldStatus,
//     bool? hearingLossStatus,
//     bool? pdStatus,
//     bool? sliStatus,
//     bool? otherStatus,
//   }) {
//     return AuthenticationStateWithBooleans(
//       dldStatus: dldStatus ?? this.dldStatus,
//       hearingLossStatus: hearingLossStatus ?? this.hearingLossStatus,
//       pdStatus: pdStatus ?? this.pdStatus,
//       sliStatus: sliStatus ?? this.sliStatus,
//       otherStatus: otherStatus ?? this.otherStatus,
//     );
//   }
// }

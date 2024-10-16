abstract class AuthenticationEvent {}

// Sign In Events ------------------------------------------------------------
class SignInEmailChanged extends AuthenticationEvent {
  final String? email;
  SignInEmailChanged(this.email);
}

class SignInPasswordChanged extends AuthenticationEvent {
  final String? password;
  SignInPasswordChanged(this.password);
}

class SignInSubmitted extends AuthenticationEvent {}

// Sign Up Events ------------------------------------------------------------
class SignUpNameChanged extends AuthenticationEvent {
  final String? name;
  SignUpNameChanged(this.name);
}

class SignUpEmailChanged extends AuthenticationEvent {
  final String? email;
  SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends AuthenticationEvent {
  final String? password;
  SignUpPasswordChanged(this.password);
}

class HandnessChanged extends AuthenticationEvent {
  final String? Handness;
  HandnessChanged(this.Handness);
}

// // Yes-No Events
// class DLDChanged extends AuthenticationEvent {
//   final bool? yesNo;
//   DLDChanged(this.yesNo);
// }

// class HearingLossChanged extends AuthenticationEvent {
//   final bool? yesNo;
//   HearingLossChanged(this.yesNo);
// }

// class PDChanged extends AuthenticationEvent {
//   final bool? yesNo;
//   PDChanged(this.yesNo);
// }

// class SLIChanged extends AuthenticationEvent {
//   final bool? yesNo;
//   SLIChanged(this.yesNo);
// }

// class OtherChanged extends AuthenticationEvent {
//   final bool? yesNo;
//   OtherChanged(this.yesNo);
// }

// Value Events
class HearingLossSideChanged extends AuthenticationEvent {
  final String? value;
  HearingLossSideChanged(this.value);
}

class HearingLossDegreeChanged extends AuthenticationEvent {
  final String? value;
  HearingLossDegreeChanged(this.value);
}

class HearingLossTypeChanged extends AuthenticationEvent {
  final String? value;
  HearingLossTypeChanged(this.value);
}

class HearingLossDeviceChanged extends AuthenticationEvent {
  final String? value;
  HearingLossDeviceChanged(this.value);
}

class PDValueChanged extends AuthenticationEvent {
  final String? value;
  PDValueChanged(this.value);
}

class SLIValueChanged extends AuthenticationEvent {
  final String? value;
  SLIValueChanged(this.value);
}

class OtherValueChanged extends AuthenticationEvent {
  final String? value;
  OtherValueChanged(this.value);
}

class PhysicianNameChanged extends AuthenticationEvent {
  final String? value;
  PhysicianNameChanged(this.value);
}

class SignUpSubmitted extends AuthenticationEvent {}

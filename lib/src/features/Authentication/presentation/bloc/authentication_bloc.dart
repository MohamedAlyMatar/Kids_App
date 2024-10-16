import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  String? name;
  String? signInEmail;
  String? signInPassword;
  String? signUpEmail;
  String? signUpPassword;
  String? handness;
  String? hearingLossSide;
  String? hearingLossDegree;
  String? hearingLossType;
  String? hearingLossDevice;
  String? pdValue;
  String? sliValue;
  String? otherValue;
  String? physicianName;

  AuthenticationBloc() : super(SignInInitial()) {
    // Handle sign-in events
    on<SignInEmailChanged>((event, emit) {
      signInEmail = event.email;
    });

    on<SignInPasswordChanged>((event, emit) {
      signInPassword = event.password;
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

    // Handle sign-up events
    on<SignUpNameChanged>((event, emit) {
      name = event.name;
      print('Name updated: $name');
    });

    on<SignUpEmailChanged>((event, emit) {
      signUpEmail = event.email;
    });

    on<SignUpPasswordChanged>((event, emit) {
      signUpPassword = event.password;
    });

    on<HandnessChanged>((event, emit) {
      handness = event.Handness;
    });

    on<HearingLossSideChanged>((event, emit) {
      hearingLossSide = event.value;
    });

    on<HearingLossDegreeChanged>((event, emit) {
      hearingLossDegree = event.value;
    });

    on<HearingLossTypeChanged>((event, emit) {
      hearingLossType = event.value;
    });

    on<HearingLossDeviceChanged>((event, emit) {
      hearingLossDevice = event.value;
    });

    on<PDValueChanged>((event, emit) {
      pdValue = event.value;
    });

    on<SLIValueChanged>((event, emit) {
      sliValue = event.value;
    });

    on<OtherValueChanged>((event, emit) {
      otherValue = event.value;
    });

    on<PhysicianNameChanged>((event, emit) {
      physicianName = event.value;
    });

    // Handle sign-up submission
    on<SignUpSubmitted>((event, emit) async {
      emit(SignUpLoading());
      try {
        // Simulate sign-up process with delay
        await Future.delayed(Duration(seconds: 2));

        // Mock saving all the sign-up data
        final String savedName = name ?? "No name provided";
        final String savedEmail = signUpEmail ?? "No email provided";
        final String savedPassword = signUpPassword ?? "No password provided";
        final String savedHandness = handness ?? "No handness provided";
        final String savedHearingLossSide =
            hearingLossSide ?? "No hearing loss side provided";
        final String savedHearingLossDegree =
            hearingLossDegree ?? "No hearing loss degree provided";
        final String savedHearingLossType =
            hearingLossType ?? "No hearing loss type provided";
        final String savedHearingLossDevice =
            hearingLossDevice ?? "No hearing loss device provided";
        final String savedPDValue = pdValue ?? "No PD value provided";
        final String savedSLIValue = sliValue ?? "No SLI value provided";
        final String savedOtherValue = otherValue ?? "No other value provided";
        final String savedPhysicianName =
            physicianName ?? "No physician name provided";

        // Print all the saved data (to mock the sign-up process)
        print('Sign-up details:');
        print('Name: $savedName');
        print('Email: $savedEmail');
        print('Password: $savedPassword');
        print('Handness: $savedHandness');
        print('Hearing Loss Side: $savedHearingLossSide');
        print('Hearing Loss Degree: $savedHearingLossDegree');
        print('Hearing Loss Type: $savedHearingLossType');
        print('Hearing Loss Device: $savedHearingLossDevice');
        print('PD Value: $savedPDValue');
        print('SLI Value: $savedSLIValue');
        print('Other Value: $savedOtherValue');
        print('Physician Name: $savedPhysicianName');

        // Emit success
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure('An error occurred while signing up'));
      }
    });
  }
}

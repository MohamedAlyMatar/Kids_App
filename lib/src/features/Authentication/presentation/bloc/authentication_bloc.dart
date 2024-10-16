import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  String? email;
  String? password;

  AuthenticationBloc() : super(SignInInitial()) {
    // Handle sign-in events
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

    // Handle sign-up events
    on<SignUpEmailChanged>((event, emit) {
      email = event.email;
    });

    on<SignUpPasswordChanged>((event, emit) {
      password = event.password;
    });

    on<SignUpSubmitted>((event, emit) async {
      emit(SignUpLoading());
      try {
        // Simulate sign-up process
        await Future.delayed(Duration(seconds: 2));
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure('An error occurred while signing up'));
      }
    });
  }
}
    //   // Handle boolean status changes
    //   bool? hasDLD = false;
    //   on<DLDChanged>((event, emit) {
    //     final currentState = state;
    //     hasDLD = event.yesNo;
    //     if (currentState is AuthenticationStateWithBooleans) {
    //       emit(currentState.copyWith(dldStatus: event.yesNo));
    //     }
    //   });

    //   on<HearingLossChanged>((event, emit) {
    //     final currentState = state;
    //     if (currentState is AuthenticationStateWithBooleans) {
    //       emit(currentState.copyWith(hearingLossStatus: event.yesNo));
    //     }
    //   });

    //   on<PDChanged>((event, emit) {
    //     final currentState = state;
    //     if (currentState is AuthenticationStateWithBooleans) {
    //       emit(currentState.copyWith(pdStatus: event.yesNo));
    //     }
    //   });

    //   on<SLIChanged>((event, emit) {
    //     final currentState = state;
    //     if (currentState is AuthenticationStateWithBooleans) {
    //       emit(currentState.copyWith(sliStatus: event.yesNo));
    //     }
    //   });

    //   on<OtherChanged>((event, emit) {
    //     final currentState = state;
    //     if (currentState is AuthenticationStateWithBooleans) {
    //       emit(currentState.copyWith(otherStatus: event.yesNo));
    //     }
    //   });


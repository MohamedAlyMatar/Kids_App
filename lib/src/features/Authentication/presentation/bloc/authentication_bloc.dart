// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:kids_app/src/features/Authentication/domain/entities/user.dart';
// import 'package:kids_app/src/features/Authentication/domain/usecases/forget_password_usecase.dart';
// import 'package:kids_app/src/features/Authentication/domain/usecases/sign_in_usecase.dart';
// import 'package:kids_app/src/features/Authentication/domain/usecases/sign_up_usecase.dart';
// import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
// import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final SignInUseCase? signInUseCase;
//   final SignUpUseCase? signUpUseCase;
//   final ForgotPasswordUseCase? forgotPasswordUseCase;

//   AuthenticationBloc({
//     this.signInUseCase,
//     this.signUpUseCase,
//     this.forgotPasswordUseCase,
//   }) : super(AuthenticationInitial());

//   @override
//   Stream<AuthenticationState> mapEventToState(
//       AuthenticationEvent event) async* {
//     if (event is SignInEvent) {
//       yield AuthenticationLoading();
//       try {
//         final user = await signInUseCase!(event.email, event.password);
//         yield Authenticated(user: user);
//       } catch (e) {
//         yield AuthenticationError(message: e.toString());
//       }
//     } else if (event is SignUpEvent) {
//       yield AuthenticationLoading();
//       try {
//         final user = await signUpUseCase!(event.email, event.password);
//         yield Authenticated(user: user);
//       } catch (e) {
//         yield AuthenticationError(message: e.toString());
//       }
//     } else if (event is ForgotPasswordEvent) {
//       yield AuthenticationLoading();
//       try {
//         await forgotPasswordUseCase!(event.email);
//         yield PasswordResetSuccess(); // Assuming you have this state defined
//       } catch (e) {
//         yield AuthenticationError(message: e.toString());
//       }
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/pages/sign_in.dart';
import 'package:kids_app/src/features/Authentication/presentation/pages/sign_up.dart';
import 'package:kids_app/src/features/Game_1/presentation/pages/game1_test.dart';
import 'package:kids_app/src/features/Game_1/presentation/pages/game1_description.dart';
import 'package:kids_app/src/features/Game_1/presentation/pages/game1_trial.dart';
import 'package:kids_app/src/features/Games/presentation/pages/games_screen.dart';
import 'package:kids_app/src/features/Games/presentation/pages/instr_screen.dart';
import 'package:kids_app/src/features/Splash/presentation/pages/splash_screen.dart';
import 'package:kids_app/src/features/Splash/presentation/pages/welcome_screen.dart';

class Routes {
  static const String initialRoute = "/";
  static const String splash = "/splash";
  static const String welcome = "/welcome";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";

  static const String gameInstruction = "/gameInstruction";
  static const String gamesMenu = "/gamesMenu";

  static const String game1desc = "/game1desc";
  static const String game1trial = "/game1trial";
  static const String game1test = "/game1test";
}

// Genrated Routes
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: const SplashScreen()));

      case Routes.welcome:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: const WelcomeScreen()));

      case Routes.signIn:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: const SignInScreen()));

      case Routes.signUp:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: SignUpScreen()));

      case Routes.gameInstruction:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: InstrScreen()));

      case Routes.gamesMenu:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: GamesScreen()));

      case Routes.game1desc:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => AuthenticationBloc(),
              child: GameDescriptionScreen()),
        );

      case Routes.game1trial:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => AuthenticationBloc(), child: Game1Trial()),
        );

      case Routes.game1test:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => AuthenticationBloc(), child: Game1Test()),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text("AppStrings.noRouteFound"),
              ),
            )));
  }
}

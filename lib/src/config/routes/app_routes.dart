import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/pages/sign_in.dart';
import 'package:kids_app/src/features/Authentication/presentation/pages/sign_up.dart';
import 'package:kids_app/src/features/Game_One/presentation/bloc/game_one_bloc.dart';
import 'package:kids_app/src/features/Game_One/presentation/pages/game_one_test.dart';
import 'package:kids_app/src/features/Game_One/presentation/pages/game_one_description.dart';
import 'package:kids_app/src/features/Game_One/presentation/pages/game_one_trial.dart';
import 'package:kids_app/src/features/Game_Three/presentation/pages/game_three_description.dart';
import 'package:kids_app/src/features/Game_Three/presentation/pages/game_three_test_one.dart';
import 'package:kids_app/src/features/Game_Three/presentation/pages/game_three_trial_one.dart';
import 'package:kids_app/src/features/Game_Two/presentation/bloc/game_two_bloc.dart';
import 'package:kids_app/src/features/Game_Two/presentation/pages/game_two_description.dart';
import 'package:kids_app/src/features/Game_Two/presentation/pages/game_two_familiarize.dart';
import 'package:kids_app/src/features/Game_Two/presentation/pages/game_two_test.dart';
import 'package:kids_app/src/features/Game_Two/presentation/pages/game_two_trial.dart';
import 'package:kids_app/src/features/Games/presentation/bloc/games_bloc.dart';
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

  // Game One Routes
  static const String gameOneDesc = "/gameOneDesc";
  static const String gameOneTrial = "/gameOneTrial";
  static const String gameOneTest = "/gameOneTest";

  // Game Two Routes
  static const String gameTwoDesc = "/gameTwoDesc";
  static const String gameTwoFam = "/gameTwoFam";
  static const String gameTwoTrial = "/gameTwoTrial";
  static const String gameTwoTest = "/gameTwoTest";

  // Game Three Routes
  static const String gameThreeDesc = "/gameThreeDesc";
  static const String gameThreeFam = "/gameThreeFam";
  static const String gameThreeTrial = "/gameThreeTrial";
  static const String gameThreeTest = "/gameThreeTest";
}

// Genrated Routes
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Splash Screen ----------------------------------------
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

      // Games Menu Routes ----------------------------------------
      case Routes.gameInstruction:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => GamesBloc(), child: InstrScreen()));

      case Routes.gamesMenu:
        return MaterialPageRoute(
            builder: (contect) => BlocProvider(
                create: (context) => GamesBloc(), child: GamesScreen()));

      // Game One Routes ----------------------------------------
      case Routes.gameOneDesc:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameOneBloc(), child: GameOneDescription()),
        );

      case Routes.gameOneTrial:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameOneBloc(), child: GameOneTrial()),
        );

      case Routes.gameOneTest:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameOneBloc(), child: GameOneTest()),
        );

      // Game Two Routes ----------------------------------------
      case Routes.gameTwoDesc:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: GameTwoDescription()),
        );

      case Routes.gameTwoTrial:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: GameTwoTrial()),
        );

      case Routes.gameTwoTest:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: GameTwoTest()),
        );

      case Routes.gameTwoFam:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: FamiliarizeScreen()),
        );

      // Game Three Routes ----------------------------------------
      case Routes.gameThreeDesc:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(),
              child: GameThreeDescription()),
        );

      case Routes.gameThreeTrial:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: GameThreeTrialOne()),
        );

      case Routes.gameThreeTest:
        return MaterialPageRoute(
          builder: (contect) => BlocProvider(
              create: (context) => GameTwoBloc(), child: GameThreeTestOne()),
        );

      // case Routes.gameThreeFam:
      //   return MaterialPageRoute(
      //     builder: (contect) => BlocProvider(
      //         create: (context) => GameTwoBloc(), child: FamiliarizeScreen()),
      //   );

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

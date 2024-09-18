import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/widgets/mytext.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.all(24.0),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mytext(
                      text: "Game Flow",
                      textColor: Colors.black,
                      textSize: 32,
                    ),
                    const SizedBox(height: 16),
                    Mytext(
                      text:
                          "Each Game contains levels and before the kid starts the test, "
                          "he will run through a trial first to know what he will face in the test.",
                      textColor: Colors.black,
                      textSize: 18,
                    ),
                    const SizedBox(height: 16),
                    Mytext(
                      text:
                          "For the kid to advance to the next level, he will have to solve both questions correctly "
                          "or 1 question but fully correct with no mistakes.",
                      textColor: Colors.black,
                      textSize: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Right container for the game list
            Flexible(
              child: Container(
                margin: const EdgeInsets.all(24.0),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GameTile("Game 1",
                        () => Navigator.pushNamed(context, Routes.gameOneDesc)),
                    const SizedBox(height: 16),
                    GameTile("Game 2",
                        () => Navigator.pushNamed(context, Routes.gameTwoDesc)),
                    const SizedBox(height: 16),
                    GameTile(
                        "Game 3",
                        () =>
                            Navigator.pushNamed(context, Routes.gameThreeDesc)),
                    const SizedBox(height: 16),
                    GameTile("Game 4",
                        () => Navigator.pushNamed(context, Routes.gameOneDesc)),
                    const SizedBox(height: 16),
                    GameTile("Game 5",
                        () => Navigator.pushNamed(context, Routes.gameOneDesc)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget GameTile(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        backgroundColor: AppColors
            .primaryColor, // Same yellow color as the Game Flow container
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3.0, // Slight elevation for a subtle shadow effect
      ),
      child: Align(
        alignment: Alignment.centerLeft, // Align text to the left
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

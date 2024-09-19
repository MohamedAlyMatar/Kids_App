import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/textDesc.dart';
import 'package:kids_app/src/core/widgets/textTitle1.dart';
import 'package:kids_app/src/core/widgets/textTitle2.dart';

class GameThreeDescription extends StatelessWidget {
  const GameThreeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors
                    .primaryColor, // Change as needed for better contrast
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitle1(textTitle: "Game 3: Teniporal Processing Test"),
                  TextTitle2(textSubTitle: "Objective"),
                  TextDesc(
                      textDesc:
                          "This game will test the kids' hearing abilities by listening to audios and choosing the right answer."),
                  TextTitle2(textSubTitle: "Instructions"),
                  TextDesc(
                      textDesc:
                          "• Click the button to play the audio and listen carefully, and the child must listen carefully. \n• After the audio finishes, the child has to choose the correct picture related to what they heard.\n• The kid will have 3 trials before taking the main test."),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1(
                  textButton: "Begin Trial",
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.gameThreeTrial),
                ),
                Button1(
                  textButton: "Begin Test",
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.gameThreeTest),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

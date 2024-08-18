import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/mytext.dart';

class InstrScreen extends StatefulWidget {
  const InstrScreen({super.key});

  @override
  State<InstrScreen> createState() => _InstrScreenState();
}

class _InstrScreenState extends State<InstrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Mytext(
                text: "Instructions",
                textColor: Colors.black,
                textSize: 32,
              ),
              SizedBox(height: 16),
              Mytext(
                text: "Sit in a QUIET place",
                textColor: Colors.black,
                textSize: 20,
              ),
              SizedBox(height: 8),
              Mytext(
                text: "Adjust the volume to MAX",
                textColor: Colors.black,
                textSize: 20,
              ),
              SizedBox(height: 8),
              Mytext(
                text: "NO HEADPHONES",
                textColor: Colors.black,
                textSize: 20,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    ImgAssets.mute,
                    width: 100,
                  ),
                  Image.asset(
                    ImgAssets.noHeadphones,
                    width: 100,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Button1(
                  textButton: "Let's Play",
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.gamesMenu)),
            ],
          ),
        ),
      ),
    );
  }
}

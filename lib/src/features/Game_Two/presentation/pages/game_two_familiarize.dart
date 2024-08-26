import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/widgets/button1.dart';

void main() {
  runApp(MaterialApp(home: FamiliarizeScreen()));
}

class FamiliarizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple
                      .shade300, // Darker purple for the title background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Familiarize yourself!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left, size: 30, color: Colors.white),
                    onPressed: () {
                      // Handle left arrow press
                    },
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70, // Adjust to match the image width
                    height: 100, // Adjust to match the image height
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100, // Card color
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon:
                        Icon(Icons.arrow_right, size: 30, color: Colors.white),
                    onPressed: () {
                      // Handle right arrow press
                    },
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              Button1(
                textButton: "Begin Trial",
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.gameTwoTrial),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

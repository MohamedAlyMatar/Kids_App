import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

class Tileheading extends StatelessWidget {
  // const Tileheading({super.key});
  Widget timer;
  String title;
  String subtitle;
  String trailing;

  Tileheading({
    super.key,
    required this.timer,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.backgroundColor,
      ),
      child: ListTile(
        leading: timer,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Adjust text color for contrast
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black, // Adjust text color for contrast
          ),
        ),
        trailing: Text(
          trailing,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Adjust text color for contrast
          ),
        ),
      ),
    );
  }
}

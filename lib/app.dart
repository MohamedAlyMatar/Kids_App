import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    ));
  }
}

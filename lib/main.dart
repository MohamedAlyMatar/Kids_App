import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/app.dart';
// import 'bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = AppBlocObserver();
  runApp(
    const MyApp(),
  );
}

import 'package:flutter/material.dart';
import 'package:food_prediction_app/app/provider.dart';
import 'package:food_prediction_app/features/splash_screen.dart';
import 'package:food_prediction_app/util/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp._();
  static final instance = MyApp._();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return getProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: getTheme(),
      ),
    );
  }
}

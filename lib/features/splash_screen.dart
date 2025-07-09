import 'package:flutter/material.dart';
import 'package:food_prediction_app/app/dependency_inj.dart';
import 'package:food_prediction_app/features/auth/login.dart';
import 'package:food_prediction_app/features/home.dart';
import 'package:food_prediction_app/util/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  redirect() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      final userToken = await instance<Storage>().getToken();
      if (userToken.isEmpty) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A875).withOpacity(0.9),
      body: Center(
        child: Text(
          "Flavour Forcast",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 48),
        ),
      ),
    );
  }
}

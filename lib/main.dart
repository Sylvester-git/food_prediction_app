import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_prediction_app/app/app.dart';
import 'package:food_prediction_app/config/config.dart';

import 'app/dependency_inj.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigServices.loadConfig();
  await init();
  log(ConfigServices.isLoaded.toString());
  runApp(MyApp());
}

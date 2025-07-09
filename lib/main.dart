import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_prediction_app/app/app.dart';
import 'package:food_prediction_app/app/bloc_observer.dart';
import 'package:food_prediction_app/config/config.dart';
import 'package:food_prediction_app/util/storage.dart';

import 'app/dependency_inj.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigServices.loadConfig();
  await init();
  await instance<Storage>().initHive();
  Bloc.observer = MyBlocObserver();
  log(ConfigServices.isLoaded.toString());
  runApp(MyApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_prediction_app/app/dependency_inj.dart';
import 'package:food_prediction_app/features/cubit/get_meal_recommendation_cubit.dart';

MultiBlocProvider getProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => instance<GetMealRecommendationCubit>()),
    ],
    child: child,
  );
}

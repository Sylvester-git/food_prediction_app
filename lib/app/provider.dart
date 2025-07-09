import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_prediction_app/app/dependency_inj.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/login_cubit.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_cubit.dart';
import 'package:food_prediction_app/features/cubits/food/cubit/foods_cubit.dart';
import 'package:food_prediction_app/features/cubits/recommendation/get_meal_recommendation_cubit.dart';

MultiBlocProvider getProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => instance<GetMealRecommendationCubit>()),
      BlocProvider(create: (context) => instance<LoginCubit>()),
      BlocProvider(create: (context) => instance<SignupCubit>()),
      BlocProvider(create: (context) => instance<FoodsCubit>()),
    ],
    child: child,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_prediction_app/features/cubit/get_meal_recommendation_cubit.dart';
import 'package:food_prediction_app/features/widgets/recommendation_button.dart';
import 'package:food_prediction_app/features/widgets/recommendation_card.dart';
import 'package:lottie/lottie.dart';

import '../util/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flavor Forecast',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<
                GetMealRecommendationCubit,
                GetMealRecommendationState
              >(
                builder: (context, state) {
                  if (state is GetMealRecommendationInitial) {
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.food_bank_rounded,
                            color: Color(0xFF00A875).withOpacity(0.9),
                            size: 100,
                          ),
                          const Text(
                            'Tap the button to get a meal recommendation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is GettingMealRecommendation) {
                    return Center(
                      child: Lottie.asset(AssetManager.foodsearching),
                    );
                  } else if (state is ErrorGettingMealRecommendation) {
                    return Text('Error: ${state.failure.message}');
                  } else if (state is GottenMealRecommendation) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecommendationCard(
                          mealrecommendationModel: state.mealRecommedationModle,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RecommendationButton(
                  onPressed: () {
                    context
                        .read<GetMealRecommendationCubit>()
                        .getMealRecommedation();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_prediction_app/features/model/meal_rec.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, required this.mealrecommendationModel});

  final MealRecommendation mealrecommendationModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.food_bank_rounded,
                        color: Color(0xFF00A875).withOpacity(0.9),
                        size: 30,
                      ),
                      Text(
                        mealrecommendationModel.type,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ...mealrecommendationModel.items.cast<String>().map((data) {
                    return Text(
                      data,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

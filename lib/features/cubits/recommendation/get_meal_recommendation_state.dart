part of 'get_meal_recommendation_cubit.dart';

abstract class GetMealRecommendationState extends Equatable {
  const GetMealRecommendationState();

  @override
  List<Object> get props => [];
}

class GetMealRecommendationInitial extends GetMealRecommendationState {}

class GettingMealRecommendation extends GetMealRecommendationState {}

class ErrorGettingMealRecommendation extends GetMealRecommendationState {
  final Failure failure;

  const ErrorGettingMealRecommendation({required this.failure});

  @override
  List<Object> get props => [failure];
}

class GottenMealRecommendation extends GetMealRecommendationState {
  final List<MealRecommendation> mealRecommedationModle;

  const GottenMealRecommendation({required this.mealRecommedationModle});

  @override
  List<Object> get props => [mealRecommedationModle];
}

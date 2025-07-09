import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_prediction_app/features/model/meal_rec.dart';
import 'package:food_prediction_app/network/db_repo.dart' show DatabaseRepo;
import 'package:food_prediction_app/network/fail.dart';

part 'get_meal_recommendation_state.dart';

class GetMealRecommendationCubit extends Cubit<GetMealRecommendationState> {
  final DatabaseRepo _databaseRepo;
  GetMealRecommendationCubit(this._databaseRepo)
    : super(GetMealRecommendationInitial());

  Future<void> getMealRecommedation() async {
    emit(GettingMealRecommendation());
    final res = await _databaseRepo.getMealRecommendation();
    res.fold(
      (l) {
        emit(ErrorGettingMealRecommendation(failure: l));
      },
      (r) {
        emit(GottenMealRecommendation(mealRecommedationModle: r));
      },
    );
  }
}

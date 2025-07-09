import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_prediction_app/features/model/category.dart';
import 'package:food_prediction_app/features/model/foods.dart';
import 'package:food_prediction_app/network/db_repo.dart';

part 'foods_state.dart';

class FoodsCubit extends Cubit<FoodsState> {
  final DatabaseRepo _databaseRepo;
  FoodsCubit(this._databaseRepo) : super(FoodsInitial());

  Future<void> getFoods() async {
    try {
      final response = await _databaseRepo.getFoods();
      response.fold(
        (l) {
          emit(ErrorGettingFoods(errormessage: l.message));
        },
        (r) {
          emit(GottenFoods(foodCategory: r));
        },
      );
    } catch (e) {
      emit(ErrorGettingFoods(errormessage: e.toString()));
    }
  }
}

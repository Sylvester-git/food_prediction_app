import 'package:food_prediction_app/features/cubit/get_meal_recommendation_cubit.dart';
import 'package:food_prediction_app/network/db_ds.dart';
import 'package:food_prediction_app/network/db_repo.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton<DatabaseDatasource>(
    () => DatabaseDatasourceImpl(),
  );
  instance.registerLazySingleton<DatabaseRepo>(
    () => DatabaseRepoImpl(instance()),
  );
  instance.registerFactory<GetMealRecommendationCubit>(
    () => GetMealRecommendationCubit(instance()),
  );
}

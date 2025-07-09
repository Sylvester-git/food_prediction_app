import 'package:food_prediction_app/features/cubits/auth/cubit/login_cubit.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_cubit.dart';
import 'package:food_prediction_app/features/cubits/food/cubit/foods_cubit.dart';
import 'package:food_prediction_app/features/cubits/recommendation/get_meal_recommendation_cubit.dart';
import 'package:food_prediction_app/network/auth_ds.dart';
import 'package:food_prediction_app/network/auth_repo.dart';
import 'package:food_prediction_app/network/db_ds.dart';
import 'package:food_prediction_app/network/db_repo.dart';
import 'package:food_prediction_app/util/storage.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton<Storage>(() => StorageImpl());
  instance.registerLazySingleton<DatabaseDatasource>(
    () => DatabaseDatasourceImpl(),
  );
  instance.registerLazySingleton<AuthDs>(() => AuthDsImpl(storage: instance()));
  instance.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDs: instance()),
  );
  instance.registerLazySingleton<DatabaseRepo>(
    () => DatabaseRepoImpl(instance()),
  );
  instance.registerLazySingleton<LoginCubit>(() => LoginCubit(instance()));
  instance.registerLazySingleton<SignupCubit>(() => SignupCubit(instance()));
  instance.registerLazySingleton<FoodsCubit>(() => FoodsCubit(instance()));
  instance.registerFactory<GetMealRecommendationCubit>(
    () => GetMealRecommendationCubit(instance()),
  );
}

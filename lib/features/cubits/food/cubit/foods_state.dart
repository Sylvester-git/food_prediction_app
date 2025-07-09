part of 'foods_cubit.dart';

sealed class FoodsState extends Equatable {
  const FoodsState();

  @override
  List<Object> get props => [];
}

final class FoodsInitial extends FoodsState {}

final class GettingFoods extends FoodsState {}

final class ErrorGettingFoods extends FoodsState {
  final String errormessage;

  const ErrorGettingFoods({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}

final class GottenFoods extends FoodsState {
  final (List<Foods>, List<Category>) foodCategory;

  const GottenFoods({required this.foodCategory});
  @override
  List<Object> get props => [foodCategory];
}

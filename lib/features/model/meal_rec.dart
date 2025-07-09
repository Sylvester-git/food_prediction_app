import 'package:equatable/equatable.dart';

class MealRecommendation extends Equatable {
  final String type;
  final List items;

  const MealRecommendation({required this.type, required this.items});

  @override
  List<Object?> get props => [type, items];
}

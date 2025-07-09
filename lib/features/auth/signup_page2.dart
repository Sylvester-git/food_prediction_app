import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_cubit.dart';
import 'package:food_prediction_app/features/cubits/food/cubit/foods_cubit.dart';

class SignupPage2 extends StatelessWidget {
  const SignupPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final signupcubit = context.watch<SignupCubit>();
    return BlocBuilder<FoodsCubit, FoodsState>(
      builder: (context, state) {
        if (state is GettingFoods || state is FoodsInitial) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ErrorGettingFoods) {
          return Center(child: Text(state.errormessage));
        }
        if (state is GottenFoods) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  state.foodCategory.$2.map((category) {
                    final categoryFoods =
                        state.foodCategory.$1
                            .where((food) => food.catid == category.id)
                            .toList();
                    if (categoryFoods.isEmpty) return const SizedBox.shrink();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children:
                              categoryFoods.map((food) {
                                final isSelected = signupcubit.state.favFoods
                                    .contains(food.id);
                                return ChoiceChip(
                                  label: Text(
                                    food.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    if (selected) {
                                      signupcubit.addToFavFoodList(
                                        foodID: food.id,
                                      );
                                    } else {
                                      signupcubit.removeToFavFoodList(
                                        foodID: food.id,
                                      );
                                    }
                                  },
                                  selectedColor:
                                      Theme.of(context).primaryColorLight,
                                  backgroundColor: Colors.grey[200],
                                  labelStyle: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                );
                              }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}

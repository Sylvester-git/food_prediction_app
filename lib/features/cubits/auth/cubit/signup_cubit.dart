import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_state.dart';

import '../../../../network/auth_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  SignupCubit(this._authRepo)
    : super(
        SignupState(
          email: '',
          password: '',
          favFoods: [],
          isLoading: false,
          haserror: false,
          errormessage: '',
          success: false,
        ),
      );
  void changeSignUpEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  void changeSignUpPasssword({required String password}) {
    emit(state.copyWith(password: password));
  }

  void addToFavFoodList({required String foodID}) {
    final list = List<String>.from(state.favFoods);
    list.add(foodID);
    emit(state.copyWith(favFoods: list));
    log(state.favFoods.toString());
  }

  Future<void> signUp() async {
    emit(state.copyWith(isLoading: true));
    try {
      final res = await _authRepo.signup(
        email: state.email,
        password: state.password,
        likedFoods: state.favFoods,
      );
      res.fold(
        (l) {
          emit(
            state.copyWith(
              isLoading: false,
              haserror: true,

              errormessage: l.message,
            ),
          );
          emit(state.copyWith(isLoading: false, haserror: false));
        },
        (r) {
          emit(state.copyWith(success: true, isLoading: false));
        },
      );
    } catch (e) {
      (l) {
        emit(
          state.copyWith(
            isLoading: false,
            haserror: true,

            errormessage: e.toString(),
          ),
        );
        emit(state.copyWith(isLoading: false, haserror: false));
      };
    }
  }
}

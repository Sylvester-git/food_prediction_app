import 'package:bloc/bloc.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/login_state.dart';

import '../../../../network/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo)
    : super(
        LoginState(
          email: '',
          password: '',
          isLoading: false,
          haserror: false,
          errormessage: '',
          success: false,
        ),
      );

  void changeLoginEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  void changeLoginPasssword({required String password}) {
    emit(state.copyWith(password: password));
  }

  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    try {
      final res = await _authRepo.login(
        email: state.email,
        password: state.password,
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

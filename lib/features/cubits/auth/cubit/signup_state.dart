// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String email;
  final String password;
  final List<String> favFoods;
  final bool isLoading;
  final bool haserror;
  final String errormessage;
  final bool success;

  const SignupState({
    required this.email,
    required this.password,
    required this.favFoods,
    required this.isLoading,
    required this.haserror,
    required this.errormessage,
    required this.success,
  });

  @override
  List<Object?> get props => [
    email,
    password,
    favFoods,
    isLoading,
    haserror,
    errormessage,
    success,
  ];

  SignupState copyWith({
    String? email,
    String? password,
    List<String>? favFoods,
    bool? isLoading,
    bool? haserror,
    String? errormessage,
    bool? success,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      favFoods: favFoods ?? this.favFoods,
      isLoading: isLoading ?? this.isLoading,
      haserror: haserror ?? this.haserror,
      errormessage: errormessage ?? this.errormessage,
      success: success ?? this.success,
    );
  }
}

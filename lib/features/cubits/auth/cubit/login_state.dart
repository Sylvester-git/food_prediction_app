// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final bool haserror;
  final String errormessage;
  final bool success;

  const LoginState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.haserror,
    required this.success,
    required this.errormessage,
  });

  @override
  List<Object?> get props => [
    email,
    password,
    isLoading,
    success,
    haserror,
    errormessage,
  ];

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? haserror,
    bool? success,
    String? errormessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      success: success ?? this.success,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      haserror: haserror ?? this.haserror,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}

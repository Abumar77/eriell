import '../../../../utils/core/enums.dart';

class LoginState {
  final String username;

  bool get isValidUsername => username.length > 3;
  final String password;

  bool get isValidPassword => password.length > 5;

  final Statuses status;
  final String? errorMessage;

  LoginState({
    this.username = '',
    this.password = '',
    this.errorMessage,
    this.status = Statuses.initial,
  });

  LoginState copyWith({
    String? username,
    String? password,
    Statuses? status,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

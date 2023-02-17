import 'package:eriell/utils/links.dart';

import '../../../../utils/core/enums.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo repo;

  LoginBloc({required this.repo}) : super(LoginState()) {
    on<LoginUsernameChanged>(
      (event, emit) => emit(
        state.copyWith(username: event.username),
      ),
    );

    on<LoginPasswordChanged>(
      (event, emit) => emit(
        state.copyWith(password: event.password),
      ),
    );

    on<LoginSubmit>(
      (event, emit) async {
        emit(state.copyWith(formStatus: Statuses.loading));
        try {
          await repo.login(state.username, state.password);
          emit(state.copyWith(formStatus: Statuses.success));
        } on Exception catch (e) {
          emit(
            state.copyWith(
              formStatus: Statuses.error,
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}

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
        emit(state.copyWith(status: Statuses.loading));
        try {
          bool userIsAuthenticated =
              await repo.login(state.username, state.password);
          if (userIsAuthenticated) {
            emit(
              state.copyWith(
                status: Statuses.authenticated,
              ),
            );
          } else {
            emit(state.copyWith(status: Statuses.error));
          }
        } on Exception catch (e) {
          emit(
            state.copyWith(
              status: Statuses.error,
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
    on<RegisterSubmit>(
      (event, emit) async {
        emit(state.copyWith(status: Statuses.loading));
        try {
          bool registered = await repo.register(state.username, state.password);
          if (registered) {
            emit(state.copyWith(status: Statuses.registered));
          } else {
            emit(state.copyWith(status: Statuses.error));
          }
          emit(state.copyWith(status: Statuses.success));
        } on Exception catch (e) {
          emit(
            state.copyWith(
              status: Statuses.error,
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}

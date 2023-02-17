import 'package:eriell/screens/authorization/presentation/bloc/login_bloc.dart';
import 'package:eriell/utils/links.dart';
import 'package:eriell/utils/shared_preferences.services.dart';

final ls = GetIt.instance;

Future<void> setup() async {
  ls.registerLazySingleton<PreferencesService>(
    () => PreferencesService(),
  );

  /// LoginBloc
  ls.registerFactory<LoginBloc>(() => LoginBloc(repo: ls()));
  ls.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(),
  );
  ////////
  //
  // /// Repos
  //
  // //  Auth
  // ls.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(remoteDataSource: ls()),
  // );
  //
  //
  // /// data sources
  // //  ///Auth
  // ls.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(),
  // );
}

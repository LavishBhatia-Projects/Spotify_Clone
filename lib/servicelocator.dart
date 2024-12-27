import 'package:get_it/get_it.dart';
import 'package:spotify_clone/core/usecase/auth/signinusecase.dart';
import 'package:spotify_clone/core/usecase/auth/signupUsecase.dart';
import 'package:spotify_clone/data/repos/auh/auth_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepoImpl());
  sl.registerSingleton<Signupusecase>(Signupusecase());
  sl.registerSingleton<Signinusecase>(Signinusecase());
}

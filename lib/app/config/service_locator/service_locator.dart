import 'package:ekilibra_spa/app/pages/login/cubit/login_cubit.dart';
import 'package:ekilibra_spa/app/pages/login/repositories/login_repository.dart';
import 'package:ekilibra_spa/app/pages/login/repositories/login_repository_impl.dart';
import 'package:ekilibra_spa/app/pages/login/usecases/login_user_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/cubit/profile_cubit.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository_impl.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/delete_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/get_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/profile_use_cases.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/register_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/update_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  getIt.registerLazySingleton(
    () => LoginCubit(
      LoginUserUseCase(getIt<LoginRepository>()),
    ),
  );

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  getIt.registerLazySingleton(
    () => ProfileCubit(
      ProfileUseCases(
        registerProfileUseCase:
            RegisterProfileUseCase(getIt<ProfileRepository>()),
        updateProfileUseCase: UpdateProfileUseCase(getIt<ProfileRepository>()),
        deleteProfileUseCase: DeleteProfileUseCase(getIt<ProfileRepository>()),
        getProfileUseCase: GetProfileUseCase(getIt<ProfileRepository>()),
      ),
    ),
  );

  getIt.registerSingleton(QuoteBloc());
}

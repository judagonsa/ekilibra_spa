import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/home/repositories/home_repository.dart';
import 'package:ekilibra_spa/app/pages/home/repositories/home_repository_impl.dart';
import 'package:ekilibra_spa/app/pages/home/use_cases/home_use_cases.dart';
import 'package:ekilibra_spa/app/pages/home/use_cases/load_services_use_case.dart';
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
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository_impl.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/create_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/delete_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/get_quotes_use_case.dart';
import 'package:ekilibra_spa/app/pages/home/use_cases/load_places_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/quote_use_cases.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/update_quote_use_case.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() async {
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

  getIt.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl());
  getIt.registerLazySingleton(
    () => QuoteBloc(
      QuoteUseCases(
        createQuoteUseCase: CreateQuoteUseCase(getIt<QuoteRepository>()),
        deleteQuoteUseCase: DeleteQuoteUseCase(getIt<QuoteRepository>()),
        getQuotesUseCase: GetQuotesUseCase(getIt<QuoteRepository>()),
        updateQuoteUseCase: UpdateQuoteUseCase(getIt<QuoteRepository>()),
      ),
    ),
  );

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  getIt.registerLazySingleton(
    () => HomeBloc(
      HomeUseCases(
        loadServicesUseCase: LoadServicesUseCase(getIt<HomeRepository>()),
        loadPlacesUseCase: LoadPlacesUseCase(getIt<HomeRepository>()),
      ),
    ),
  );
}

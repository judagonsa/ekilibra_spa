import 'package:ekilibra_spa/app/pages/profile/usecases/delete_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/get_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/register_profile_use_case.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/update_profile_use_case.dart';

class ProfileUseCases {
  final RegisterProfileUseCase registerProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final DeleteProfileUseCase deleteProfileUseCase;
  final GetProfileUseCase getProfileUseCase;

  ProfileUseCases({
    required this.registerProfileUseCase,
    required this.updateProfileUseCase,
    required this.deleteProfileUseCase,
    required this.getProfileUseCase,
  });
}

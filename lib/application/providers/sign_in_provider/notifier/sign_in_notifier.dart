import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/repositorys/profile_repository.dart';
import 'states/sign_in_state.dart';

final signInProvider = StateNotifierProvider(
  (ref) => SignInNotifier(
    repository: ref.read(profileRepository),
    service: ref.read(profileService),
  ),
);

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required this.repository,
    required this.service,
  }) : super(const SignInState());

  final ProfileService service;
  final ProfileRepository repository;

  Future<void> signInWithGoogle() async {
    state = state.copyWith(signInFlg: true);

    final result = await service.signInWithGoogle();

    if (!result.isError) {
      await repository.saveUsesrData(result.asValue!.value);
    }
    state = state.copyWith(signInFlg: false);
  }
}

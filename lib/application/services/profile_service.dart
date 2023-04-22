import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entity/profile/profile.dart';
import '../../infrastructure/repositorys/profile_repository.dart';

final profileService = Provider(
  (ref) => ProfileService(
    profileRepository: ref.read(profileRepository),
  ),
);

class ProfileService {
  ProfileService({required profileRepository})
      : _profileRepository = profileRepository;

  final _auth = FirebaseAuth.instance;
  String? get userId => _auth.currentUser?.uid;
  final ProfileRepository _profileRepository;

  void subscribeUserProfile(
    void Function(Profile) onCompleted,
  ) {
    _profileRepository.subscribeStream(
      onCompleted,
    );
  }

  Future<Result<UserCredential>> signInWithGoogle() async {
    late final UserCredential userCredential;

    try {
      final googleUser = await GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]).signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value(userCredential);
  }
}

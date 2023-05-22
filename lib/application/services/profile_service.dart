import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/repositorys/profile_repository.dart';
import '../providers/profile_notifier_provider/state/profile.dart';

final profileServiceProvider = Provider(
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

  void subscribeSearchUserProfile(
    void Function(List<Profile>) onCompleted,
    List<String> memberList,
  ) {
    _profileRepository.subscribeSearchUserStream(
      onCompleted,
      memberList,
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

  Future<void> saveUserData(UserCredential credential) async {
    await _profileRepository.saveUsesrData(credential);
  }

  Future<Result> updateTags(List<String> tags) async {
    return await _profileRepository.updateTag(tags);
  }

  Future<Result<Profile?>> searchUser(String uid) async {
    return await _profileRepository.searchUser(uid);
  }

  Future<void> signOut() async {
    await _profileRepository.signOut();
  }

  Future<Result> editProfile(String name, String imageUrl) async {
    return await _profileRepository.editProfile(name, imageUrl);
  }
}

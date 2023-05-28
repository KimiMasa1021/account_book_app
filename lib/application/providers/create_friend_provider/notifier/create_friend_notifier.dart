import 'package:account_book_app/application/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../common/toast_message.dart';
import '../../../services/api_service.dart';
import '../../go_router_provider/routes/routes.dart';
import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../profile_notifier_provider/state/profile.dart';
import '../state/create_friend.dart';

class CreateFriendNotifier extends StateNotifier<CreateFriend> {
  CreateFriendNotifier(
    this.ref, {
    required ProfileService profileService,
    required ApiService apiService,
  })  : _profileService = profileService,
        _apiService = apiService,
        super(const CreateFriend());
  final Ref ref;
  final ProfileService _profileService;
  final ApiService _apiService;
  final _toastMessage = ToastMessage();

  void changePage() {
    state = state.copyWith(pageType: !state.pageType);
  }

  Future<void> onQRViewCreated(
    QRViewController controller,
    Function() movePage,
  ) async {
    controller.pauseCamera();
    controller.resumeCamera();
    final profile = ref.read(profileNotifierProvider);
    controller.scannedDataStream.listen(
      (scanData) async {
        if (!state.isScanAble) return;
        final user = await searchUser(scanData.code!);
        // ローディング開始　スキャン停止
        state = state.copyWith(user: user, isLoading: true, isScanAble: false);
        if (scanData.code == profile.uid) {
          _toastMessage.shwoToast("自分自身を登録することはできません");
        } else if (state.user != null) {
          movePage();
        }
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<Profile?> searchUser(String uid) async {
    final result = await _profileService.searchUser(uid);
    if (!result.isError) {
      return result.asValue?.value;
    }
    return null;
  }

  void pushProfilePage(BuildContext context) {
    context.push(
      "${Routes.setting}/${Routes.createFriend}/${Routes.userProfile}",
      extra: state.user,
    );
  }

  Future<void> sendFriendRequest(String uid) async {
    final result = await _apiService.sendFriendRequest(uid);

    if (!result.isError) {
      _toastMessage.shwoToast("フレンド登録完了");
    } else {
      _toastMessage.shwoToast("エラーが発生しました。");
    }
  }

  void changeScanState() {
    state = state.copyWith(isScanAble: true);
  }
}

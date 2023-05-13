import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
part 'create_friend.freezed.dart';

@freezed
class CreateFriend with _$CreateFriend {
  const factory CreateFriend({
    @Default(false) bool pageType,
    @Default(false) bool isLoading,
    QRViewController? controller,
    @Default(null) Profile? user,
    @Default("") String qrData,
    @Default("") String qrPrevious,
  }) = _CreateFriend;
}

import 'package:account_book_app/view/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

enum Pages {
  top,
  signUp,
  signIn,
}

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class PageState with _$PageState {
  factory PageState({
    @Default(Pages.top) page,
  }) = _PageState;
}

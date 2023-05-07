import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../saving_provider/provider/saving_notifier_provider.dart';
import '../../search_user_provider/provider/search_user_provider.dart';

final savingByMemberProvider =
    FutureProviderFamily((ref, TargetState arg) async {
  final saving = ref.watch(savingNotifierProvider(arg.productId)).value;
  final searchUser = ref.watch(searchUserNotifierProvider(arg.members));

  // final aa =  saving.whenData((value) => value);
  return "";
});

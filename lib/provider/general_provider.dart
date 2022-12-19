import 'package:account_book_app/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constant/enums.dart';
import '../controller/friends_controller.dart';
import '../controller/users_controller.dart';
import '../model/users_state.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
        (ref) => AuthController(ref));

final incomeExpendSwicherProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final selectedSavingProvider = StateProvider.autoDispose<int>((ref) => 0);
final memberListProvider =
    StateProvider.autoDispose<List<UsersState>>((ref) => []);
final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState?>(
        (ref) => UsersController(ref));
final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.account);
// final accountControllerPrvider = StateNotifierProvider.autoDispose<
//     AccountController,
//     AsyncValue<List<AccountState>>>((ref) => AccountController(ref));

final friendsListControllerProvider =
    StateNotifierProvider<FriendsController, List<UsersState>>(
        (ref) => FriendsController(ref));

// final processingPriceProvider =
//     Provider.autoDispose.family((ref, DateTime setDate) {
//   return ref.watch(accountControllerPrvider).whenData((state) {
//     List<AccountState> allState = state.isNotEmpty ? state.toList() : [];
//     List<AccountState> monthlyState = state.isNotEmpty
//         ? state
//             .where(
//               (p) =>
//                   p.registeTime.month == setDate.month &&
//                   p.registeTime.year == setDate.year,
//             )
//             .toList()
//         : [];
//     List<AccountState> expendState = state.isNotEmpty
//         ? state
//             .where(
//               (p) =>
//                   p.price < 0 &&
//                   p.registeTime.month == setDate.month &&
//                   p.registeTime.year == setDate.year,
//             )
//             .toList()
//         : [];
//     List<AccountState> incomeState = state.isNotEmpty
//         ? state
//             .where(
//               (p) =>
//                   p.price > 0 &&
//                   p.registeTime.month == setDate.month &&
//                   p.registeTime.year == setDate.year,
//             )
//             .toList()
//         : [];
//     List<int> priceList = state
//         .where(
//           (e) =>
//               e.registeTime.month == setDate.month &&
//               e.registeTime.year == setDate.year,
//         )
//         .map((a) => a.price)
//         .toList();
//     int expend = expendState.isNotEmpty
//         ? priceList
//             .where((p) => p < 0)
//             .toList()
//             .reduce((value, element) => value + element)
//         : 0;
//     int income = incomeState.isNotEmpty
//         ? priceList
//             .where((p) => p > 0)
//             .toList()
//             .reduce((value, element) => value + element)
//         : 0;
//     List<AccountState> expendStateYearly = state.isNotEmpty
//         ? state
//             .where(
//               (p) => p.price < 0 && p.registeTime.year == setDate.year,
//             )
//             .toList()
//         : [];
//     List<AccountState> incomeStateYearly = state.isNotEmpty
//         ? state
//             .where(
//               (p) => p.price > 0 && p.registeTime.year == setDate.year,
//             )
//             .toList()
//         : [];
//     return PriceState(
//       allState: allState,
//       monthlyState: monthlyState,
//       expendState: expendState,
//       incomeState: incomeState,
//       expend: expend,
//       income: income,
//       expendStateYearly: expendStateYearly,
//       incomeStateYearly: incomeStateYearly,
//     );
//   });
// });

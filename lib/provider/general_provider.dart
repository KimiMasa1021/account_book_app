import 'package:account_book_app/controller/account_controller.dart';
import 'package:account_book_app/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/enums.dart';
import '../controller/saving_controller.dart';
import '../controller/users_controller.dart';
import '../model/account_state.dart';
import '../model/price_state.dart';
import '../model/saving_state.dart';
import '../model/users_state.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.account);

final incomeExpendSwicherProvider = StateProvider<bool>((ref) => true);

final usersControllerProvider =
    StateNotifierProvider<UsersController, UsersState?>(
        (ref) => UsersController(ref.read));

final savingControllerProvider =
    StateNotifierProvider<SavingController, List<SavingState>>(
        (ref) => SavingController(ref.read));

final accountControllerPrvider =
    StateNotifierProvider<AccountController, AsyncValue<List<AccountState>>>(
        (ref) => AccountController(ref.read));

// final setDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final processingPriceProvider = Provider.family((ref, DateTime setDate) {
  // final setDate = ref.watch(setDateProvider);
  return ref.watch(accountControllerPrvider).whenData((state) {
    List<AccountState> monthlyState = state.isNotEmpty
        ? state
            .where(
              (p) =>
                  p.registeTime.month == setDate.month &&
                  p.registeTime.year == setDate.year,
            )
            .toList()
        : [];
    List<AccountState> expendState = state.isNotEmpty
        ? state
            .where(
              (p) =>
                  p.price < 0 &&
                  p.registeTime.month == setDate.month &&
                  p.registeTime.year == setDate.year,
            )
            .toList()
        : [];
    List<AccountState> incomeState = state.isNotEmpty
        ? state
            .where(
              (p) =>
                  p.price > 0 &&
                  p.registeTime.month == setDate.month &&
                  p.registeTime.year == setDate.year,
            )
            .toList()
        : [];
    List<int> priceList = state
        .where(
          (e) =>
              e.registeTime.month == setDate.month &&
              e.registeTime.year == setDate.year,
        )
        .map((a) => a.price)
        .toList();
    int expend = expendState.isNotEmpty
        ? priceList
            .where((p) => p < 0)
            .toList()
            .reduce((value, element) => value + element)
        : 0;
    int income = incomeState.isNotEmpty
        ? priceList
            .where((p) => p > 0)
            .toList()
            .reduce((value, element) => value + element)
        : 0;

    return PriceState(
      monthlyState: monthlyState,
      expendState: expendState,
      incomeState: incomeState,
      expend: expend,
      income: income,
    );
  });
});

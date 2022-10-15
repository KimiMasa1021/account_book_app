import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_state.dart';
part 'price_state.freezed.dart';

@freezed
class PriceState with _$PriceState {
  const PriceState._();
  factory PriceState({
    @Default([]) List<AccountState> allState,
    @Default([]) List<AccountState> monthlyState,
    @Default([]) List<AccountState> expendState,
    @Default([]) List<AccountState> incomeState,
    @Default([]) priceList,
    @Default(0) expend,
    @Default(0) income,
  }) = _PriceState;
}

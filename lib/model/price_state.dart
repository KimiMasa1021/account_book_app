import 'package:freezed_annotation/freezed_annotation.dart';
part 'price_state.freezed.dart';

@freezed
class PriceState with _$PriceState {
  const PriceState._();
  factory PriceState({
    @Default([]) expendState,
    @Default([]) incomeState,
    @Default([]) priceList,
    @Default(0) expend,
    @Default(0) income,
  }) = _PriceState;
}

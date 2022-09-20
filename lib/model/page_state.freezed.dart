// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PageState {
  dynamic get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageStateCopyWith<PageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageStateCopyWith<$Res> {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) then) =
      _$PageStateCopyWithImpl<$Res>;
  $Res call({dynamic page});
}

/// @nodoc
class _$PageStateCopyWithImpl<$Res> implements $PageStateCopyWith<$Res> {
  _$PageStateCopyWithImpl(this._value, this._then);

  final PageState _value;
  // ignore: unused_field
  final $Res Function(PageState) _then;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_PageStateCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory _$$_PageStateCopyWith(
          _$_PageState value, $Res Function(_$_PageState) then) =
      __$$_PageStateCopyWithImpl<$Res>;
  @override
  $Res call({dynamic page});
}

/// @nodoc
class __$$_PageStateCopyWithImpl<$Res> extends _$PageStateCopyWithImpl<$Res>
    implements _$$_PageStateCopyWith<$Res> {
  __$$_PageStateCopyWithImpl(
      _$_PageState _value, $Res Function(_$_PageState) _then)
      : super(_value, (v) => _then(v as _$_PageState));

  @override
  _$_PageState get _value => super._value as _$_PageState;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$_PageState(
      page: page == freezed ? _value.page : page,
    ));
  }
}

/// @nodoc

class _$_PageState implements _PageState {
  _$_PageState({this.page = Pages.top});

  @override
  @JsonKey()
  final dynamic page;

  @override
  String toString() {
    return 'PageState(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageState &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$_PageStateCopyWith<_$_PageState> get copyWith =>
      __$$_PageStateCopyWithImpl<_$_PageState>(this, _$identity);
}

abstract class _PageState implements PageState {
  factory _PageState({final dynamic page}) = _$_PageState;

  @override
  dynamic get page;
  @override
  @JsonKey(ignore: true)
  _$$_PageStateCopyWith<_$_PageState> get copyWith =>
      throw _privateConstructorUsedError;
}

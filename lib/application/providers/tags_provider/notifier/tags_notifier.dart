import 'package:account_book_app/application/providers/go_router_provider/routes/routes.dart';
import 'package:account_book_app/application/providers/tags_provider/state/initialize_tag.dart';
import 'package:account_book_app/application/services/tags_service.dart';
import 'package:account_book_app/common/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagsNotifier extends StateNotifier<InitializeTag> {
  TagsNotifier({required TagsService tagsService})
      : _tagsService = tagsService,
        super(const InitializeTag());

  final TagsService _tagsService;
  final _toastMessage = ToastMessage();

  final List<String> initTagList = [
    "通信費",
    "光熱費",
    "食費",
    "お菓子",
    "課金",
    "ジュース",
    "外食を控えた！",
    "被服費・美容費",
    "娯楽費抑える",
    "交通費",
    "自炊した",
    "タバコ我慢した",
    "コンビニ",
    "節水した！",
    "電気代節約",
    "ショッピング割引",
    "施設利用",
    "ポイント還元",
    "家電省エネ",
    "不用品売った",
    "インターネット見直し",
    "自転車利用",
    "飲み物持参",
    "不用品リサイクル",
    "おやつ持参",
    "洗濯量減らす",
    "キャッシュバック活用",
    "エコバッグ持参",
    "家庭菜園",
    "シェアリング利用",
    "業務スーパー利用",
    "セール品活用",
    "飲料水持参",
    "フリマアプリ利用",
  ];

  void switchTag(String tag) {
    if (!state.tags.contains(tag)) {
      state = state.copyWith(
        tags: [...state.tags, tag],
      );
    } else {
      List<String> parts = List.of(state.tags);
      final index = parts.indexOf(tag);
      parts.removeAt(index);
      state = state.copyWith(
        tags: parts,
      );
    }
  }

  Future<void> initializeTag(Function() goHome) async {
    if (state.tags.length < 3) {
      _toastMessage.shwoToast("３つ以上えらんでね♥");
      return;
    }
    state = state.copyWith(isLoading: true);
    await _tagsService.initializeTag(state.tags);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false);
    goHome();
  }

  Future<void> goHome(BuildContext context) async {
    context.go(Routes.test1);
  }
}

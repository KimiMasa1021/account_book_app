import 'package:account_book_app/application/providers/edit_tag_provider/state/edit_tag.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../presentation/widgets/edit_tag/delete_dialog.dart';
import '../../../../presentation/widgets/edit_tag/tag_dialog.dart';
import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';

class EditTagNotifier extends StateNotifier<EditTag> {
  EditTagNotifier(
    this.ref, {
    required ProfileService profileService,
  })  : _profileService = profileService,
        super(const EditTag());
  final Ref ref;
  final ProfileService _profileService;

  Future<void> editTagName(BuildContext context, String tag) async {
    final profile = ref.read(profileNotifierProvider);
    showDialog(
      context: context,
      builder: (context) {
        return TagDialog(
          dialogTitle: 'タグの編集',
          enterText: '編集する',
          hintText: 'タグの名前',
          initialText: tag,
          onTap: (newTagName) async {
            final List<String> tagsList = List.from(profile.tags);
            final editTagIndex = tagsList.indexOf(tag);
            tagsList[editTagIndex] = newTagName;
            await _profileService.updateTags(tagsList);
          },
        );
      },
    );
  }

  Future<void> deleteTag(BuildContext context, String tag) async {
    final profile = ref.read(profileNotifierProvider);
    final List<String> tagsList = List.from(profile.tags);
    tagsList.removeWhere((element) => element == tag);
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          dialogTitle: "タグを削除しますか？",
          tagText: tag,
          onTap: () async => await _profileService.updateTags(tagsList),
        );
      },
    );
  }

  Future<void> onReorder(int oldIndex, int newIndex) async {
    final profile = ref.read(profileNotifierProvider);

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final List<String> tagsList = List.from(profile.tags);
    final item = tagsList.removeAt(oldIndex);
    tagsList.insert(newIndex, item);
    await _profileService.updateTags(tagsList);
  }

  Future<void> addTag(BuildContext context) async {
    final profile = ref.read(profileNotifierProvider);
    showDialog(
      context: context,
      builder: (context) {
        return TagDialog(
          dialogTitle: '新しいタグの作成',
          enterText: 'タグを作成',
          hintText: 'タグの名前',
          initialText: "",
          onTap: (newTagName) async {
            final List<String> tagsList = List.from(profile.tags);
            if (tagsList.contains(newTagName)) return;
            final newTagList = [...tagsList, newTagName];
            await _profileService.updateTags(newTagList);
          },
        );
      },
    );
  }
}

import 'package:account_book_app/application/providers/edit_tag_provider/state/edit_tag.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';

class EditTagNotifier extends StateNotifier<EditTag> {
  EditTagNotifier(
    this.ref, {
    required ProfileService profileService,
  })  : _profileService = profileService,
        super(const EditTag());
  final Ref ref;
  final ProfileService _profileService;

  Future<void> editTagName() async {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return TagDialog(
    //       dialogTitle: 'タグの編集',
    //       enterText: '編集する',
    //       hintText: 'タグの名前',
    //       initialText: tags[index].tag,
    //       onTap: (tag) async {
    //         await tagsCTL.updateTag(tag, tags[index].id);
    //       },
    //     );
    //   },
    // );
  }
  Future<void> deleteTag() async {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return DeleteDialog(
    //       dialogTitle: "タグを削除しますか？",
    //       tagText: tags[index].tag,
    //       onTap: () async {
    //         await tagsCTL.deleteTag(tags[index].id);
    //       },
    //     );
    //   },
    // );
  }

  Future<void> onReorder(int oldIndex, int newIndex) async {
    final profile = ref.read(profileNotifierProvider);

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final List<String> tagsList = List.from(profile.tags);
    final item = tagsList.removeAt(oldIndex);
    tagsList.insert(newIndex, item);
    await _profileService.sortTags(tagsList);
  }

  void addTag() {
    // if (oldIndex < newIndex) {
    //   newIndex -= 1;
    // }
    // final test = tags;
    // final item = test.removeAt(oldIndex);
    // test.insert(newIndex, item);
    // // await tagsCTL.sortTags(test);
  }
}

// import 'package:account_book_app/repository/target_init_repository.dart';
// import 'package:account_book_app/repository/target_repository.dart';
// import 'package:account_book_app/view/pages/detail/add_saving/widgets/calculator_button.dart';
// import 'package:account_book_app/view_model/tags_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../model/saving/saving_state.dart';
// import '../model/target/target_state.dart';
// import '../utility/price_formatter.dart';
// import 'auth_controller.dart';

// final savingControllerProvider = StateNotifierProvider.family<
//     SavingController,
//     AsyncValue<List<SavingState>>,
//     String>((ref, String docId) => SavingController(ref, docId));

// class SavingController extends StateNotifier<AsyncValue<List<SavingState>>> {
//   final Ref ref;
//   final String docId;
//   SavingController(this.ref, this.docId) : super(const AsyncValue.loading()) {
//     ref.read(targetRepositoryProvider).feachSaving(docId).listen((data) {
//       state = AsyncValue.data(data.map((doc) => doc.data()).toList());
//     });
//   }

//   Future<List<int>> culcWeeklyList(
//     List<SavingState> savingList,
//     ValueNotifier<DateTime> date,
//   ) async {
//     final startWeekDate =
//         date.value.subtract(Duration(days: date.value.weekday - 1));
//     final endWeekDate = date.value.add(Duration(days: 7 - date.value.weekday));
//     final weekSavingList = savingList
//         .where(
//           (e) =>
//               e.createdAt
//                   .isAfter(startWeekDate.add(const Duration(days: -1))) &&
//               e.createdAt.isBefore(endWeekDate),
//         )
//         .toList();
//     return List.generate(7, (index) {
//       final weeklySaving = weekSavingList
//           .where((e) => e.createdAt.weekday == index + 1)
//           .map((e) => e.price)
//           .toList();

//       if (weeklySaving.isEmpty) {
//         return 0;
//       }
//       return weeklySaving.reduce((v, e) => v + e);
//     });
//   }

//   Future<void> calcButtonFunction(
//     KeyType keyType,
//     int? value,
//     TextEditingController priceController,
//     ValueNotifier<int?>? tagValue,
//     TargetState target,
//     List<SavingState> saving,
//     Function() function,
//   ) async {
//     switch (keyType) {
//       //数字
//       case KeyType.number:
//         final preText = priceController.text;
//         priceController.value = CustomTextInputFormatter().formatEditUpdate(
//           TextEditingValue(text: preText),
//           TextEditingValue(text: preText + value.toString()),
//         );
//         break;
//       //削除
//       case KeyType.backSpeace:
//         if (priceController.text.isEmpty) return;
//         final preText = priceController.text;
//         priceController.value = CustomTextInputFormatter().formatEditUpdate(
//           TextEditingValue(text: preText),
//           TextEditingValue(text: preText.substring(0, preText.length - 1)),
//         );
//         break;
//       //エンター
//       case KeyType.enter:
//         if (isSavingErr(priceController, tagValue!)) return;
//         final uid = ref.read(authControllerProvider)!.uid;
//         final tags = ref.read(tagsControllerProvider);

//         final priceList = saving
//             .where((e) => e.productId == target.docId)
//             .map((e) => e.price)
//             .toList();
//         int sum;
//         if (priceList.isEmpty) {
//           sum = 0;
//         } else {
//           sum = priceList.reduce((a, b) => a + b);
//         }
//         final priceInt = int.parse(priceController.text.replaceAll(",", ""));
//         final state = SavingState(
//           createdAt: DateTime.now(),
//           price: priceInt,
//           productId: target.docId,
//           userId: uid,
//           memo: tags.singleWhere((e) => e.id == tagValue.value).tag,
//         );
//         await ref.read(targetRepositoryProvider).addSaving(state);
//         await ref.read(targetInitRepositoryProvider).updateTotalSaving(
//               target.targetPrice > sum + priceInt ? false : true,
//               sum + priceInt,
//               target.docId,
//             );
//         function();
//         break;
//       default:
//         break;
//     }
//   }

//   bool isSavingErr(
//     TextEditingController priceController,
//     ValueNotifier<int?> tagValue,
//   ) {
//     if (priceController.text == "" && tagValue.value == null) {
//       showToast("すべて入力してね");
//       return true;
//     }
//     if (priceController.text == "") {
//       showToast("金額を入力してね");
//       return true;
//     }
//     if (tagValue.value == null) {
//       showToast("タグを選択してね");
//       return true;
//     }
//     return false;
//   }

//   void showToast(String msg) {
//     Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       textColor: const Color.fromARGB(255, 255, 255, 255),
//       fontSize: 16.0,
//     );
//   }

//   String formatWeek(int weekIndex) {
//     final week = [
//       "月",
//       "火",
//       "水",
//       "木",
//       "金",
//       "土",
//       "日",
//     ];
//     return week[weekIndex - 1];
//   }

//   String formatDate(DateTime date) {
//     final week = [
//       "月",
//       "火",
//       "水",
//       "木",
//       "金",
//       "土",
//       "日",
//     ];
//     return "${DateFormat("MM月dd日(").format(date)}${week[date.weekday - 1]})";
//   }
// }

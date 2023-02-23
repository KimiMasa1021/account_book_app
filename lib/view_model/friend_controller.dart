import 'dart:convert';
import 'package:account_book_app/model/user/users_state.dart';
import 'package:account_book_app/repository/friend_repository.dart';
import 'package:account_book_app/view_model/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final friendsControllerProvider =
    StateNotifierProvider<FriendController, List<UsersState>>(
        (ref) => FriendController(ref));

class FriendController extends StateNotifier<List<UsersState>> {
  final Ref ref;

  final String baseUrl =
      "https://asia-northeast1-account-book-app-af1e7.cloudfunctions.net";
  final headers = {'content-type': 'application/json'};

  FriendController(this.ref) : super([]) {
    ref.read(friendRepositoryProvider).feachFriends().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }

  Uri requestUrl(String endpoint) => Uri.parse('$baseUrl$endpoint');

  //検索でのフレンドリクエスト
  Future<void> friendRequest(String uid) async {
    final myUid = ref.read(usersControllerProvider)!.uid;
    const endpoint = '/friendRequest';
    final url = requestUrl(endpoint);
    final sendJSON = {
      "process": "フレンドリクエスト",
      "user1": {"uid": myUid},
      "user2": {"uid": uid}
    };
    final String body = json.encode(sendJSON);

    await http.post(url, headers: headers, body: body);
    shwoToast("友達リクエストを送信しました！");
  }

  //検索でのフレンド承認
  Future<void> friendApproval(String uid, String name) async {
    final myUid = ref.read(usersControllerProvider)!.uid;
    const endpoint = '/friendApproval';
    final url = requestUrl(endpoint);
    final sendJSON = {
      "process": "承認リクエスト",
      "user1": {"uid": myUid},
      "user2": {"uid": uid}
    };
    final String body = json.encode(sendJSON);

    await http.post(url, headers: headers, body: body);
    shwoToast("$nameさんと友達になりました!");
  }

  //検索でのフレンド承認
  //  いつかアップデートでLINEみたいな機能実装しようかな
  Future<void> qrFriendRequest(String uid) async {
    final myUid = ref.read(usersControllerProvider)!.uid;
    final friens = ref.read(usersControllerProvider)!.friends;

    debugPrint(friens.toString());
    debugPrint(uid.toString());
    debugPrint(myUid.toString());

    if (friens.contains(uid)) {
      return shwoToast("既にに登録済みです");
    }
    if (uid.contains("//")) {
      return shwoToast("無効なQRコードです");
    }
    const endpoint = '/qrFriendRequest';
    final url = requestUrl(endpoint);
    final sendJSON = {
      "process": "QRフレンドリクエスト",
      "user1": {"uid": myUid},
      "user2": {"uid": uid}
    };
    final String body = json.encode(sendJSON);
    await http.post(url, headers: headers, body: body);
    shwoToast("フレンド登録が完了しました！");
  }

  void shwoToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }
}

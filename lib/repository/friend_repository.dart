import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final friendRepositoryProvider =
    Provider<FriendRepository>((ref) => FriendRepositoryImple(ref));

abstract class FriendRepository {
  Future<FrendRequestResult> addFriend(String user1Uid, String user2Uid);
}

enum FrendRequestResult {
  success,
  alreadyRegistered,
  error,
  injustice,
  notExist,
}

class FriendRepositoryImple implements FriendRepository {
  final Ref ref;

  FriendRepositoryImple(this.ref);

  @override
  Future<FrendRequestResult> addFriend(String user1Uid, String user2Uid) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
            'https://asia-northeast1-account-book-app-af1e7.cloudfunctions.net/friendProcess'),
      );
      request.body = json.encode({
        "process": "フレンド登録",
        "user1": {"uid": user1Uid},
        "user2": {"uid": user2Uid}
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final log = await response.stream.bytesToString();
        switch (log) {
          case "success":
            return FrendRequestResult.success;
          case "already_registered":
            return FrendRequestResult.alreadyRegistered;
          case "error":
            return FrendRequestResult.error;
          case "injustice":
            return FrendRequestResult.injustice;
          case "not_exist":
            return FrendRequestResult.notExist;
          default:
            return FrendRequestResult.error;
        }
      } else {
        return FrendRequestResult.error;
      }
    } catch (e) {
      debugPrint(e.toString());
      return FrendRequestResult.error;
    }
  }
}

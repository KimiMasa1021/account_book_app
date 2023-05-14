import 'dart:convert';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/domain/repository/api_repository_base.dart';
import 'package:async/src/result/result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final apiRepositoryProvider = Provider((ref) => ApiRepositroy(ref));

class ApiRepositroy implements ApiRepositoryBase {
  late String baseUrl;
  late String baseUrlDev;
  final flavorName = const String.fromEnvironment('flavor');
  final headers = {'content-type': 'application/json'};

  ApiRepositroy(this.ref) {
    baseUrl = "https://asia-northeast1-group-saving-app.cloudfunctions.net";
    baseUrlDev =
        "https://asia-northeast1-account-book-app-dev.cloudfunctions.net";
  }
  final Ref ref;

  Uri requestUrl(String endpoint) {
    return flavorName == "dev"
        ? Uri.parse('$baseUrlDev$endpoint')
        : Uri.parse('$baseUrl$endpoint');
  }

  @override
  Future<Result<String?>> sendFriendRequest(String friendUid) async {
    try {
      // String endPoint = "/qrFriendRequest";
      // final myUid = ref.read(profileNotifierProvider).uid;
      // final sendJSON = {
      //   "process": "QRフレンドリクエスト",
      //   "user1": {"uid": myUid},
      //   "user2": {"uid": friendUid}
      // };
      // final url = requestUrl(endPoint);
      // final String body = json.encode(sendJSON);
      // await http.post(url, headers: headers, body: body);
      // return Result.value(friendUid);
      final myUid = ref.read(profileNotifierProvider).uid;
      final friens = ref.read(profileNotifierProvider).friends;
      debugPrint("myid  " + myUid);
      debugPrint("friendUid  " + friendUid);

      if (friens.contains(friendUid)) {
        return Result.error("");
      }
      const endpoint = '/qrFriendRequest';
      final url = requestUrl(endpoint);
      final sendJSON = {
        "process": "QRフレンドリクエスト",
        "user1": {"uid": myUid},
        "user2": {"uid": friendUid}
      };
      final String body = json.encode(sendJSON);
      await http.post(url, headers: headers, body: body);
      return Result.value(friendUid);
    } on Exception {
      return Result.error("");
    }
  }
}

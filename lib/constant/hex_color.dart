import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
                              // function: () async {
                              //   FocusScope.of(context).unfocus();
                              //   loading.value = true;
                              //   try {
                              //     final email = emailController.text;
                              //     final password = passwordController.text;
                              //     final name = nameController.text;

                              //     await authController.signUp(
                              //         email, password, name);
                              //   } catch (e) {
                              //     debugPrint(e.toString());
                              //   }
                              //   loading.value = false;
                              // },


















  //                               final Reader _read;
  // StreamSubscription<User?>? _authStateChangesSubscription;

  // AuthController(this._read) : super(null) {
  //   _authStateChangesSubscription?.cancel();
  //   _authStateChangesSubscription = _read(authRepositoryProvider)
  //       .authStateChanges
  //       .listen((user) => state = user);
  // }
  // @override
  // User? get state => _read(authRepositoryProvider).getCurrentUser();

  // Future<void> signIn(String email, String password) async {
  //   try {
  //     if (!validate2(email, password)) return showToast("no-data");

  //     final flg =
  //         await _read(authRepositoryProvider).signInWithEmail(email, password);
  //     if (flg != null) {
  //       showToast(flg);
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Future<void> signUp(String email, String password, String name) async {
  //   try {
  //     if (!validate(email, password, name)) return showToast("no-data");

  //     final flg =
  //         await _read(authRepositoryProvider).signUp(email, password, name);
  //     if (flg == null) {
  //       await _read(authRepositoryProvider).saveUserData(name);
  //     } else {
  //       showToast(flg);
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
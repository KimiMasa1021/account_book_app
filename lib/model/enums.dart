// フレンドリクエストの結果
enum FrendRequestResult {
  success,
  alreadyRegistered,
  error,
  injustice,
  notExist,
}

//　ボトムバーの状態
enum PageType {
  home,
  setting,
}

// ユーザーの操作の状態
enum TargetInitFlg {
  inputing,
  creating,
  complete,
}

// ユーザーの操作の状態 lottie loadingで使う
enum WebViewType {
  privacyPolicy,
  appHint,
  aboutApp,
}

enum LottieUrl {
  catLoading,
  complete,
  inventLoading,
  login,
  logout,
  pig,
  warning,
  yellowLoading,
}

extension ExLottieUrl on LottieUrl {
  String get url {
    switch (this) {
      case LottieUrl.catLoading:
        return "assets/json/cat_loading.json";
      case LottieUrl.complete:
        return "assets/json/complete.json";
      case LottieUrl.inventLoading:
        return "assets/json/invent_loading.json";
      case LottieUrl.login:
        return "assets/json/login.json";
      case LottieUrl.logout:
        return "assets/json/logout.json";
      case LottieUrl.pig:
        return "assets/json/pig.json";
      case LottieUrl.warning:
        return "assets/json/warning.json";
      case LottieUrl.yellowLoading:
        return "assets/json/yellow_loading.json";
      default:
        return "assets/json/cat_loading.json";
    }
  }
}

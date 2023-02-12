enum AssetsUrl {
  catLoading,
  complete,
  inventLoading,
  login,
  logout,
  pig,
  warning,
  yellowLoading,
  empty,
}

extension ExAssetsUrl on AssetsUrl {
  String get url {
    switch (this) {
      case AssetsUrl.catLoading:
        return "assets/json/cat_loading.json";
      case AssetsUrl.complete:
        return "assets/json/complete.json";
      case AssetsUrl.inventLoading:
        return "assets/json/invent_loading.json";
      case AssetsUrl.login:
        return "assets/json/login.json";
      case AssetsUrl.logout:
        return "assets/json/logout.json";
      case AssetsUrl.pig:
        return "assets/json/pig.json";
      case AssetsUrl.warning:
        return "assets/json/warning.json";
      case AssetsUrl.yellowLoading:
        return "assets/json/yellow_loading.json";
      case AssetsUrl.empty:
        return "assets/img/empty.svg";
      default:
        return "assets/json/cat_loading.json";
    }
  }
}

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

extension ExAssetsUrl on LottieUrl {
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

enum SvgUrl {
  empty,
  search,
  team,
}

extension ExSvgUrl on SvgUrl {
  String get url {
    switch (this) {
      case SvgUrl.empty:
        return "assets/img/svg/empty.svg";
      case SvgUrl.search:
        return "assets/img/svg/search.svg";
      case SvgUrl.team:
        return "assets/img/svg/team.svg";
      default:
        return "assets/img/svg/empty.svg";
    }
  }
}

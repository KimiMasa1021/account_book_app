class MyLottieData {
  MyLottieData({
    required this.loadingPath,
    required this.loadingText,
    required this.resultPath,
    required this.resultText,
  });

  final String loadingPath;
  final String loadingText;
  final String resultPath;
  final String resultText;

  factory MyLottieData.addProject() {
    return MyLottieData(
      loadingPath: 'assets/json/cat_loading.json',
      loadingText: '作成中...',
      resultPath: 'assets/json/complete.json',
      resultText: '作成できました',
    );
  }

  factory MyLottieData.editProject() {
    return MyLottieData(
      loadingPath: 'assets/json/yellow_loading.json',
      loadingText: '編集中...',
      resultPath: 'assets/json/complete.json',
      resultText: '編集できました',
    );
  }

  factory MyLottieData.inviteMember() {
    return MyLottieData(
      loadingPath: 'assets/json/invent_loading.json',
      loadingText: '招待中...',
      resultPath: 'assets/json/complete.json',
      resultText: 'メンバーに追加されました！',
    );
  }
}

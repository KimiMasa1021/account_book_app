import 'package:account_book_app/utility/lottie_url.dart';

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
      loadingPath: AssetsUrl.catLoading.url,
      loadingText: '作成中...',
      resultPath: AssetsUrl.complete.url,
      resultText: '作成できました',
    );
  }

  factory MyLottieData.editProject() {
    return MyLottieData(
      loadingPath: AssetsUrl.yellowLoading.url,
      loadingText: '編集中...',
      resultPath: AssetsUrl.complete.url,
      resultText: '編集できました',
    );
  }

  factory MyLottieData.inviteMember() {
    return MyLottieData(
      loadingPath: AssetsUrl.inventLoading.url,
      loadingText: '招待中...',
      resultPath: AssetsUrl.complete.url,
      resultText: 'メンバーに追加されました！',
    );
  }
}

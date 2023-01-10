package com.kmass.account_book_app
import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import io.flutter.embedding.android.SplashScreen

class CustomSplashScreen : SplashScreen {
    // 1. splash_view.xmlをInflate
    override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? =
            LayoutInflater.from(context).inflate(R.layout.splash_view, null, false)

    // 2. Flutterのフレームのレンダリングの準備ができたら呼び出される
    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        // 3. CustomSplashScreen (SplashScreen)の削除
        onTransitionComplete.run()
    }
}
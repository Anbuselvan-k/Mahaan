# Keep the Flutter framework
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# If you're using plugins (like share_plus, url_launcher)
-keep class dev.fluttercommunity.** { *; }
-dontwarn dev.fluttercommunity.**
-keep class com.google.android.gms.auth.api.credentials.** { *; }
-dontwarn com.google.android.gms.auth.api.credentials.**
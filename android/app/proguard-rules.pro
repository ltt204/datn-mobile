# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/Cellar/android-sdk/24.3.3/tools/proguard/proguard-android.txt

# Keep WebView related classes
-keep class android.webkit.** { *; }
-keep class androidx.webkit.** { *; }

# Keep JavaScript interface classes
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep classes that might be used by WebView
-keepattributes JavascriptInterface
-keepattributes *Annotation*

# Don't obfuscate classes used by WebView
-keep class * extends android.webkit.WebViewClient
-keep class * extends android.webkit.WebChromeClient

# Video codec related classes (to fix the codec errors)
-keep class android.media.** { *; }
-dontwarn android.media.**
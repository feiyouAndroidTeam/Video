# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
#-dontshrink
#-dontoptimize
#-dontwarn com.google.android.maps.**
#-dontwarn android.webkit.WebView
#-dontwarn com.umeng.**
#-dontwarn com.tencent.weibo.sdk.**
#-dontwarn com.facebook.**
#
#-libraryjars libs/SocialSDK_QQZone_2.jar
#
#-keep enum com.facebook.**
#-keepattributes Exceptions,InnerClasses,Signature
#-keepattributes *Annotation*
#-keepattributes SourceFile,LineNumberTable
#
#-keep public interface com.facebook.**
#-keep public interface com.tencent.**
#-keep public interface com.umeng.socialize.**
#-keep public interface com.umeng.socialize.sensor.**
#-keep public interface com.umeng.scrshot.**
#
#-keep public class com.umeng.socialize.* {*;}
#-keep public class javax.**
#-keep public class android.webkit.**
#
#-keep class com.facebook.**
#-keep class com.umeng.scrshot.**
#-keep public class com.tencent.** {*;}
#-keep class com.umeng.socialize.sensor.**
#
#-keep class com.tencent.mm.sdk.modelmsg.WXMediaMessage {*;}
#
#-keep class com.tencent.mm.sdk.modelmsg.** implements com.tencent.mm.sdk.modelmsg.WXMediaMessage$IMediaObject {*;}
#
#-keep class im.yixin.sdk.api.YXMessage {*;}
#-keep class im.yixin.sdk.api.** implements im.yixin.sdk.api.YXMessage$YXMessageData{*;}
#
#-keep public class [your_pkg].R$*{
#    public static final int *;
#}

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-allowaccessmodification
-verbose
-optimizations !code/simplification/arithmetic,!field/*,field/propagation/value,!class/merging/*,!code/allocation/variable

-ignorewarnings
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-dontoptimize

-keep class com.ksyun.** {
  *;
}

-keep class com.ksy.statlibrary.** {
  *;
}

-keep class com.ksyun.media.shortvideo.** {
  *;
}

-keep class com.ksyun.media.kmcfilter.** {
*;
}

-keep class com.sensetime.sensear.** {
*;
}

-keep class com.sensetime.sensear.** {
*;
}

-keep class com.googlecode.mp4parser.** {
  *;
}

-keep class com.mp4parser.** {
  *;
}

-keep class com.coremedia.iso.** {
  *;
}

-keep class com.ksyun.media.player.**{ *; }
-keep class com.ksy.statlibrary.**{ *;}
-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}
-keep class android.support.**{*;}
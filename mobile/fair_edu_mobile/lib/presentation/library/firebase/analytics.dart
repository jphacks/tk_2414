import 'package:recase/recase.dart';

// SEE: https://developers.google.com/android/reference/com/google/firebase/analytics/FirebaseAnalytics.Event
enum FirebaseAnalyticsEvent {
  screenView,
  ;

  String get key => switch (this) {
        screenView => 'screen_view',
      };
}

// SEE: https://developers.google.com/android/reference/com/google/firebase/analytics/FirebaseAnalytics.Param
enum FirebaseAnalyticsParam {
  screenName,
  screenClass,
  ;

  String get key => switch (this) {
        screenName => 'firebase_screen',
        screenClass => 'firebase_screen_class',
      };
}

enum FirebaseAnalyticsCustomParam {
  screenName,
  ;

  String get key => name.snakeCase;
}

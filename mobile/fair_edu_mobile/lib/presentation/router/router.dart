import 'package:fair_edu_mobile/presentation/components/framework/loading/delay.dart';
import 'package:fair_edu_mobile/presentation/components/framework/loading/progress.dart';
import 'package:fair_edu_mobile/presentation/pages/display_save_image/display_save_image.dart';
import 'package:fair_edu_mobile/presentation/pages/error/error.dart';
import 'package:fair_edu_mobile/presentation/pages/home/home.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/lecture.dart';
import 'package:fair_edu_mobile/presentation/pages/my_lecture/my_lecture.dart';
import 'package:fair_edu_mobile/presentation/pages/my_page/my_page.dart';
import 'package:fair_edu_mobile/presentation/pages/search/saerch.dart';
import 'package:fair_edu_mobile/presentation/router/nested_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

typedef WidgetOrLoadingBuilder = Widget Function(
  BuildContext context,
  bool shouldLoading,
);

Page<T> customPageBuilder<T>(
  Widget child, {
  LocalKey? materialPageKey,
}) =>
    MaterialPage<T>(
      key: materialPageKey,
      child: child,
    );

WidgetOrLoadingBuilder _loadingDelayDisplayBuilder(Widget child) =>
    (context, shouldLoading) => LoadingDelayDisplay(
          isLoading: shouldLoading,
          loading: const Scaffold(
            body: Center(
              child: CustomProgressIndicator(),
            ),
          ),
          childBuilder: (_) => child,
        );

final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'RootNavigatorKey');

final _shellNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'ShellPatientRecordList');

final _shellNavigatorKeySearch =
    GlobalKey<NavigatorState>(debugLabel: 'ShellSearch');

final _shellNavigatorKeyMyLecture =
    GlobalKey<NavigatorState>(debugLabel: 'ShellPatientMyLecture');

final _shellNavigatorKeyMyPage =
    GlobalKey<NavigatorState>(debugLabel: 'ShellMyPage');

final _defaultLocation = const HomeRoute().location;

///================================================================================================
///
/// NoAuth Routes
///
///================================================================================================
@TypedGoRoute<ErrorRoute>(
  path: '/error',
  name: ErrorScreen.name,
)
class ErrorRoute extends GoRouteData {
  const ErrorRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        const ErrorScreen(),
      );
}

// @TypedGoRoute<SignInRoute>(
//   path: '/sign-in',
//   name: SignInScreen.name,
// )
// class SignInRoute extends GoRouteData {
//   const SignInRoute();

//   static final GlobalKey<NavigatorState> $parentNavigatorKey =
//       _rootNavigatorKey;

//   @override
//   Page<void> buildPage(context, state) => customPageBuilder(
//         const SignInScreen(),
//       );
// }

///------------------------------------------------------------------------------------------------
///
/// Stateful Shell Route
///
///------------------------------------------------------------------------------------------------
@TypedStatefulShellRoute<CustomStatefulShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: '/home',
          name: HomeScreen.name,
        ),
      ],
    ),
    TypedStatefulShellBranch<SearchBranch>(
      routes: [
        TypedGoRoute<SearchRoute>(
          path: '/search',
          name: SearchScreen.name,
        ),
      ],
    ),
    TypedStatefulShellBranch<MyLectureBranch>(
      routes: [
        TypedGoRoute<MyLectureRoute>(
          path: '/my-lecture',
          name: MyLectureScreen.name,
        ),
      ],
    ),
    TypedStatefulShellBranch<MyPageBranch>(
      routes: [
        TypedGoRoute<MyPageRoute>(
          path: '/my-page',
          name: MyPageScreen.name,
        ),
      ],
    ),
  ],
)
class CustomStatefulShellRoute extends StatefulShellRouteData {
  const CustomStatefulShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
  }
}

///------------------------------------------------------------------------------------------------
/// Patient record list Shell Route
///------------------------------------------------------------------------------------------------
class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKeyHome;
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        const HomeScreen(),
      );
}

///------------------------------------------------------------------------------------------------
/// Search Shell Route
///------------------------------------------------------------------------------------------------

class SearchBranch extends StatefulShellBranchData {
  const SearchBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      _shellNavigatorKeySearch;
}

class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        const SearchScreen(),
      );
}

class MyLectureBranch extends StatefulShellBranchData {
  const MyLectureBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      _shellNavigatorKeyMyLecture;
}

class MyLectureRoute extends GoRouteData {
  const MyLectureRoute();

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        const MyLectureScreen(),
      );
}

class MyPageBranch extends StatefulShellBranchData {
  const MyPageBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      _shellNavigatorKeyMyPage;
}

class MyPageRoute extends GoRouteData {
  const MyPageRoute();

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        const MyPageScreen(),
      );
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    // Debug modeではログを出す
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: _defaultLocation,
    routes: $appRoutes,
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    errorPageBuilder: (context, state) => customPageBuilder(
      kReleaseMode
          ? const ErrorScreen()
          : Scaffold(
              body: Center(
                child: Text('Error: ${state.error}'),
              ),
            ),
      materialPageKey: state.pageKey,
    ),
  );
}

// ///------------------------------------------------------------------------------------------------
// ///
// /// Other Routes
// ///
// ///------------------------------------------------------------------------------------------------

@TypedGoRoute<LectureRoute>(
  path: '/my-lecture/:id/:courseId/:lectureId',
  name: LectureScreen.name,
)
class LectureRoute extends GoRouteData {
  const LectureRoute(
      {required this.id, required this.courseId, required this.lectureId});

  final String id;
  final String courseId;
  final String lectureId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        LectureScreen(
          id: id,
          courseId: courseId,
          lectureId: lectureId,
        ),
      );
}

@TypedGoRoute<DisplaySavedImageRoute>(
  path: '/my-lecture/:fileName',
  name: DisplaySavedImage.name,
)
class DisplaySavedImageRoute extends GoRouteData {
  DisplaySavedImageRoute({required this.fileName});

  final String fileName;

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Page<void> buildPage(context, state) => customPageBuilder(
        DisplaySavedImage(
          fileName: fileName,
        ),
      );
}



// @TypedGoRoute<PatientRecordDetailRoute>(
//   path: '/record/:id',
//   name: PatientRecordDetailScreen.name,
// )
// class PatientRecordDetailRoute extends GoRouteData {
//   const PatientRecordDetailRoute({
//     required this.id,
//   });

//   final String id;

//   static final GlobalKey<NavigatorState> $parentNavigatorKey =
//       _rootNavigatorKey;

//   @override
//   Page<void> buildPage(context, state) => customPageBuilder(
//         MeRouteGuard(
//           builder: _loadingDelayDisplayBuilder(
//             PatientRecordDetailScreen(
//               id: id,
//             ),
//           ),
//         ),
//       );
// }

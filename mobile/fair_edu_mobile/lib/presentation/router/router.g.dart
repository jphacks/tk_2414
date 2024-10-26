// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $errorRoute,
      $customStatefulShellRoute,
      $lectureRoute,
      $displaySavedImageRoute,
    ];

RouteBase get $errorRoute => GoRouteData.$route(
      path: '/error',
      name: 'Error',
      parentNavigatorKey: ErrorRoute.$parentNavigatorKey,
      factory: $ErrorRouteExtension._fromState,
    );

extension $ErrorRouteExtension on ErrorRoute {
  static ErrorRoute _fromState(GoRouterState state) => const ErrorRoute();

  String get location => GoRouteData.$location(
        '/error',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $customStatefulShellRoute => StatefulShellRouteData.$route(
      factory: $CustomStatefulShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: HomeBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/home',
              name: 'Home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SearchBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/search',
              name: 'ListLecture',
              factory: $SearchRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: MyLectureBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/my-lecture',
              name: 'MyLecture',
              factory: $MyLectureRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: MyPageBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/my-page',
              name: 'Profile',
              factory: $MyPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $CustomStatefulShellRouteExtension on CustomStatefulShellRoute {
  static CustomStatefulShellRoute _fromState(GoRouterState state) =>
      const CustomStatefulShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyLectureRouteExtension on MyLectureRoute {
  static MyLectureRoute _fromState(GoRouterState state) =>
      const MyLectureRoute();

  String get location => GoRouteData.$location(
        '/my-lecture',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyPageRouteExtension on MyPageRoute {
  static MyPageRoute _fromState(GoRouterState state) => const MyPageRoute();

  String get location => GoRouteData.$location(
        '/my-page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lectureRoute => GoRouteData.$route(
      path: '/my-lecture/:id/:courseId/:lectureId',
      name: 'Lecture',
      parentNavigatorKey: LectureRoute.$parentNavigatorKey,
      factory: $LectureRouteExtension._fromState,
    );

extension $LectureRouteExtension on LectureRoute {
  static LectureRoute _fromState(GoRouterState state) => LectureRoute(
        id: state.pathParameters['id']!,
        courseId: state.pathParameters['courseId']!,
        lectureId: state.pathParameters['lectureId']!,
      );

  String get location => GoRouteData.$location(
        '/my-lecture/${Uri.encodeComponent(id)}/${Uri.encodeComponent(courseId)}/${Uri.encodeComponent(lectureId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $displaySavedImageRoute => GoRouteData.$route(
      path: '/my-lecture/:fileName',
      name: 'DisplaySavedImage',
      parentNavigatorKey: DisplaySavedImageRoute.$parentNavigatorKey,
      factory: $DisplaySavedImageRouteExtension._fromState,
    );

extension $DisplaySavedImageRouteExtension on DisplaySavedImageRoute {
  static DisplaySavedImageRoute _fromState(GoRouterState state) =>
      DisplaySavedImageRoute(
        fileName: state.pathParameters['fileName']!,
      );

  String get location => GoRouteData.$location(
        '/my-lecture/${Uri.encodeComponent(fileName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'e44165e1d862a84bbe3db343aa65f0a9272399ad';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

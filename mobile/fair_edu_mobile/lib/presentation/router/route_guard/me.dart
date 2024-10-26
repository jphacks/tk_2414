// import 'package:example/presentation/pages/auth/controller.dart';
// import 'package:example/presentation/router/route_guard/auth.dart';
// import 'package:example/presentation/router/router.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class MeRouteGuard extends StatelessWidget {
//   const MeRouteGuard({
//     super.key,
//     required this.builder,
//   });

//   final WidgetOrLoadingBuilder builder;

//   @override
//   Widget build(BuildContext context) {
//     return AuthRouteGuard(
//       builder: (context, shouldLoadingParent) {
//         return Consumer(
//           builder: (context, ref, _) {
//             final shouldLoading = shouldLoadingParent ||
//                 switch (ref.watch(meProvider)) {
//                   AsyncValue(isLoading: true, hasValue: false) => true,
//                   _ => false,
//                 };
//             return builder(context, shouldLoading);
//           },
//         );
//       },
//     );
//   }
// }

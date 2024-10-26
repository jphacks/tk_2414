// import 'package:example/domain/model/entity/multi_factor.dart';
// import 'package:example/domain/model/exception/code.dart';
// import 'package:example/domain/model/exception/exception.dart';
// import 'package:example/presentation/components/framework/snack_bar/snack_bar.dart';
// import 'package:example/presentation/components/framework/snack_bar/snack_bar_content.dart';
// import 'package:example/presentation/pages/auth/controller.dart';
// import 'package:example/presentation/pages/exception.dart';
// import 'package:example/presentation/router/router.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AuthRouteGuard extends HookConsumerWidget {
//   const AuthRouteGuard({
//     super.key,
//     required this.builder,
//   });

//   final WidgetOrLoadingBuilder builder;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authAsync = ref.watch(authProvider);
//     final shouldLoading = switch (authAsync) {
//       AsyncValue(isLoading: true) => (() {
//           return true;
//         })(),
//       AsyncValue(:final error?) => (() {
//           if (error is AuthException) {
//             switch (error.code) {
//               case AuthExceptionCode.secondFactorNotEnrolled:
//                 // 二段階認証が登録されていない場合は、登録画面へ
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   const MFAEnrollmentRoute().go(context);
//                 });
//                 return false;
//               case AuthExceptionCode.secondFactorRequired:
//                 {
//                   // 二段階認証が登録されているが認証されていない場合は、認証画面へ
//                   if (error.exception is FirebaseAuthMultiFactorException) {
//                     final exception =
//                         error.exception as FirebaseAuthMultiFactorException;
//                     WidgetsBinding.instance.addPostFrameCallback((_) {
//                       MFAVerificationRoute(
//                         $extra: (
//                           info: VerifyMultiFactorInfoEntity(
//                             resolver: exception.resolver,
//                           ),
//                         ),
//                       ).go(context);
//                     });
//                   }
//                   return true;
//                 }
//               default:
//                 break;
//             }
//           }
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar(
//                 content: SnackBarContentFailure(
//                   title: '認証情報が不正です',
//                   description: errorToDisplayMessage(error),
//                 ),
//               ),
//             );
//             const SignInRoute().go(context);
//           });
//           return true;
//         })(),
//       AsyncValue(:final value, hasValue: true) => (() {
//           if (value == null) {
//             WidgetsBinding.instance.addPostFrameCallback((_) async {
//               const SignInRoute().go(context);
//             });
//             return true;
//           }
//           return false;
//         })(),
//       _ => true,
//     };
//     return builder(context, shouldLoading);
//   }
// }

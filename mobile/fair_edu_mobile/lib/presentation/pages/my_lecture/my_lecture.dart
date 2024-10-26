import 'package:fair_edu_mobile/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyLectureScreen extends HookConsumerWidget {
  const MyLectureScreen({
    super.key,
  });

  static const name = 'MyLecture';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Lecture'),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            const LectureRoute(
              id: "lec11",
              lectureId: 'lec11',
              courseId: 'lec11',
            ).go(context);
          },
          child: const Text('Go to Lecture'),
        ),
      ),
    );
  }
}

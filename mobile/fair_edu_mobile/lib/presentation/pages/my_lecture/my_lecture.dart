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
      body: const Center(
        child: Text('My Lecture'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LectureScreen extends HookConsumerWidget {
  const LectureScreen({
    super.key,
    required this.id,
    required this.courseId,
    required this.lectureId,
  });

  final String id;
  final String courseId;
  final String lectureId;

  static const name = 'Lecture';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FairEdu'),
      ),
      body: const Center(
        child: Text('Lecture'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends HookConsumerWidget {
  const MyPageScreen({
    super.key,
  });

  static const name = 'Profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: const Center(
        child: Text('My Page'),
      ),
    );
  }
}

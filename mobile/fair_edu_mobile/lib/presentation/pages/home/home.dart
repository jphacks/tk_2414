import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  static const name = 'Home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FairEdu'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}

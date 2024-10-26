import 'package:fair_edu_mobile/presentation/components/framework/tab_bar/bottom_navigation_tab_bar.dart';
import 'package:fair_edu_mobile/presentation/library/hooks/custom_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScaffoldWithNestedNavigation extends HookConsumerWidget {
  const ScaffoldWithNestedNavigation({
    super.key = const ValueKey('ScaffoldWithNestedNavigation'),
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    HapticFeedback.mediumImpact();
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useCustomTabController(
      initialLength: 4,
      initialIndex: 0,
    );

    useEffect(
      () {
        tabController.addListener(() {
          if (tabController.indexIsChanging) {
            _goBranch(tabController.index);
          }
        });
        return null;
      },
      const [],
    );

    if (navigationShell.currentIndex != tabController.index) {
      Future.delayed(
        Duration.zero,
        () {
          tabController.index = navigationShell.currentIndex;
        },
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationTabBar(
        tabController: tabController,
        tabItems: [
          NavigationBarItem(
            label: 'ホーム',
            icon: const PhosphorIcon(
              PhosphorIconsRegular.house,
              semanticLabel: 'ホーム',
            ),
            selectedIcon: const PhosphorIcon(
              PhosphorIconsFill.house,
              semanticLabel: 'ホーム',
            ),
          ),
          NavigationBarItem(
            label: '検索',
            icon: const PhosphorIcon(
              PhosphorIconsRegular.magnifyingGlass,
              semanticLabel: '検索',
            ),
            selectedIcon: const PhosphorIcon(
              PhosphorIconsFill.magnifyingGlass,
              semanticLabel: '検索',
            ),
          ),
          NavigationBarItem(
            label: '受講中',
            icon: const PhosphorIcon(
              PhosphorIconsRegular.bookmarksSimple,
              semanticLabel: '受講中',
            ),
            selectedIcon: const PhosphorIcon(
              PhosphorIconsFill.bookmarksSimple,
              semanticLabel: '受講中',
            ),
          ),
          NavigationBarItem(
            label: 'マイページ',
            icon: const PhosphorIcon(
              PhosphorIconsRegular.userCircle,
              semanticLabel: 'マイページ',
            ),
            selectedIcon: const PhosphorIcon(
              PhosphorIconsFill.userCircle,
              semanticLabel: 'マイページ',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _tabIndicatorSize = 20.0;

class NavigationBarItem {
  NavigationBarItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final Widget icon;
  final Widget? selectedIcon;
}

class BottomNavigationTabBar extends HookConsumerWidget {
  const BottomNavigationTabBar({
    super.key,
    required this.tabItems,
    required this.tabController,
  });

  final List<NavigationBarItem> tabItems;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => HookBuilder(
        builder: (context) {
          final tabIndicatorPadding = useMemoized(
            () =>
                (constraints.maxWidth / tabItems.length - _tabIndicatorSize) /
                2,
            [constraints.maxWidth, tabItems.length],
          );
          return Material(
            color: appTheme.colorTheme.background,
            type: MaterialType.card,
            elevation: 8,
            shape: Border(
              top: BorderSide(
                width: 1,
                color: appTheme.colorTheme.outline,
              ),
            ),
            child: SafeArea(
              child: SizedBox(
                height: spacingUnit * 8,
                child: HookBuilder(
                  builder: (context) {
                    final selectedIndex = useState<int>(tabController.index);
                    useEffect(
                      () {
                        listener() {
                          selectedIndex.value = tabController.index;
                        }

                        tabController.addListener(listener);
                        return () {
                          tabController.removeListener(listener);
                        };
                      },
                      const [],
                    );
                    return TabBar(
                      dividerHeight: 0,
                      controller: tabController,
                      isScrollable: false,
                      tabs: tabItems
                          .mapIndexed(
                            (index, item) => Tab(
                              child: Column(
                                children: [
                                  index == selectedIndex.value
                                      ? item.selectedIcon ?? item.icon
                                      : item.icon,
                                  const Gap(spacingUnit / 4),
                                  Text(item.label),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      indicatorColor: appTheme.colorTheme.primary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      labelColor: appTheme.colorTheme.primary,
                      labelStyle: appTheme.textTheme.labelXs.copyWith(
                        color: appTheme.colorTheme.primary,
                      ),
                      unselectedLabelColor: appTheme.colorTheme.textSecondary,
                      unselectedLabelStyle: appTheme.textTheme.labelXs.copyWith(
                        color: appTheme.colorTheme.textSecondary,
                      ),
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide.none,
                      ),
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: tabIndicatorPadding,
                        vertical: spacingUnit / 2,
                      ),
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: spacingUnit,
                        vertical: spacingUnit,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

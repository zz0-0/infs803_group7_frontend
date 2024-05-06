import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';

class AdaptiveScaffoldWidget extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AdaptiveScaffoldWidget({
    super.key,
    required this.navigationShell,

    // required this.body,
    // this.floatingActionButton,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdaptiveScaffoldWidgetState();
}

class _AdaptiveScaffoldWidgetState
    extends ConsumerState<AdaptiveScaffoldWidget> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    void goBranch(int index) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.layout.breakpoint > LayoutBreakpoint.sm) {
          return NavigationSideBar(
            body: widget.navigationShell,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: goBranch,
          );
        } else {
          return NavigationBottomBar(
            body: widget.navigationShell,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: goBranch,
          );
        }
      },
    );
  }
}

class NavigationSideBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Widget body;

  const NavigationSideBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

class NavigationBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Widget body;

  const NavigationBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onDestinationSelected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.book),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            label: 'Third',
          ),
        ],
      ),
    );
  }
}
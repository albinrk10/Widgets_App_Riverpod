import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_albin/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDraweIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDraweIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDraweIndex = value;
          });

          final menuItem = appMenuIteams[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Main'),
          ),
          ...appMenuIteams.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(26, 16, 16, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(
              28,
              10,
              16,
              10,
            ),
            child: Text('More options'),
          ),
          ...appMenuIteams.sublist(3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}

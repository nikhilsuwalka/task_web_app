import 'package:flutter/material.dart';
import 'package:task_web_app/nav_drawer/navigation_drawer_header.dart';
import 'package:task_web_app/navbar_item/navbar_item.dart';
import 'package:task_web_app/routing/route_names.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem('Services', ServiceRoute, icon: Icons.home_repair_service),
          NavBarItem('About', AboutRoute, icon: Icons.help),
        ],
      ),
    );
  }
}

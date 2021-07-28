import 'package:flutter/material.dart';
import 'package:task_web_app/ResponsiveBuilder/responsive_builder.dart';
import 'package:task_web_app/navigation_bar/navigation_bar_mobile.dart';
import 'package:task_web_app/navigation_bar/navigation_bar_tablet_desktop.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}

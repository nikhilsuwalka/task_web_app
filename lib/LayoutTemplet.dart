import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_web_app/routing/route_names.dart';
import 'package:task_web_app/routing/router.dart';
import 'package:task_web_app/services/navigation_service.dart';

import 'Views/centered_view.dart';
import 'locator.dart';
import 'nav_drawer/navigation_drawer.dart';
import 'navigation_bar/navigation_bar.dart';

class LayoutTemplet extends StatelessWidget {
  const LayoutTemplet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

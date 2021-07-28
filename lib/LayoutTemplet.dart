import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_web_app/ResponsiveBuilder/responsive_builder.dart';
import 'package:task_web_app/Views/centered_view.dart';
import 'package:task_web_app/locator.dart';
import 'package:task_web_app/nav_drawer/navigation_drawer.dart';
import 'package:task_web_app/navigation_bar/navigation_bar.dart';
import 'package:task_web_app/routing/route_names.dart';
import 'package:task_web_app/routing/router.dart';
import 'package:task_web_app/services/navigation_service.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

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

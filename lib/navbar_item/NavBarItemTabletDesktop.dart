import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_web_app/Models/NavBarItemModel.dart';

class NavBarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
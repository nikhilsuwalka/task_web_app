import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_web_app/Models/NavBarItemModel.dart';

class NavBarItemMobile extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: <Widget>[
          Icon(model.iconData),
          SizedBox(
            width: 20,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
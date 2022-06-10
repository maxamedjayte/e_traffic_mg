import 'package:badges/badges.dart';
import 'package:e_traffic_mg/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: appBarColor,
        border: Border.all(color: Colors.grey.withOpacity(.3)),
      ),
      child: Badge(
          padding: EdgeInsets.all(3),
          position: BadgePosition.topEnd(top: -7, end: 2),
          badgeContent: Text(
            '',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.notifications_rounded)),
    );
  }
}

import 'package:e_traffic_mg/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget extends StatelessWidget {
  const SlidableWidget(
      {Key? key,
      required this.child,
      this.onFinish,
      this.onIgnore,
      this.controller})
      : super(key: key);
  final Widget child;
  final SlidableController? controller;
  final GestureTapCallback? onFinish;
  final GestureTapCallback? onIgnore;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      groupTag: controller,
      child: child,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 1 / 2,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: red,
            foregroundColor: Colors.white,
            icon: Icons.close,
            label: 'Remove',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: green,
            foregroundColor: Colors.white,
            icon: Icons.play_arrow_outlined,
            label: 'Start',
          ),
        ],
      ),
    );
  }
}

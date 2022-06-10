import 'package:flutter/material.dart';

import 'avatar_image.dart';

class UserBox extends StatelessWidget {
  UserBox(
      {Key? key,
      required this.user,
      this.isSVG = false,
      this.width = 55,
      this.height = 55,
      this.isNamed = true,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500})
      : super(key: key);
  final user;
  double width;
  double height;
  double fontSize;
  FontWeight fontWeight;
  bool isSVG;
  bool isNamed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarImage(
          user["image"],
          isSVG: isSVG,
          width: width,
          height: height,
        ),
        SizedBox(
          height: 8,
        ),
        if (isNamed)
          Text(
            user["fullname"],
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          )
      ],
    );
  }
}

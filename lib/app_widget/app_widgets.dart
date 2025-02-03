import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WallPaperBgWidget extends StatelessWidget {

  double mHeight=200;
  double mWidth=150;
  String imageUrl;

  WallPaperBgWidget({ required this.imageUrl,mHeight,mWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mHeight,
        width: mWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),

    );
  }
}

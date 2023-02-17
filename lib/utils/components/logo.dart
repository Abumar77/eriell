import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.imageHeight, this.imageWidth, this.imagePadding})
      : super(key: key);
  final double? imageWidth;
  final double? imageHeight;
  final double? imagePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(imagePadding ?? 24.0),
      child: Center(
        child: Assets.images.enterLogo.image(
          width: imageWidth ?? MediaQuery.of(context).size.width * 0.5,
          height: imageHeight,
        ),
      ),
    );
  }
}

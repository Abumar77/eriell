import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const CustomLoader({
    Key? key,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

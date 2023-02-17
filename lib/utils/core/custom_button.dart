

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final double? height;

  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height ?? 56,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).primaryColor.withOpacity(0.10);
              }
              return color ?? Theme.of(context).primaryColor;
            }),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}

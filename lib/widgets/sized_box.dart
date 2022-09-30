import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  const MySizedBox({ super.key, this.width, this.height, required this.child });

  final double? width;
  final double? height;
  final Widget child;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}

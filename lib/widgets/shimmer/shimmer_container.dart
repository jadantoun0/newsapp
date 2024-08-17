import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets margin;
  final double borderRadius;

  const ShimmerContainer({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: margin,
    );
  }
}

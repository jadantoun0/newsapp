import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerColorWidget extends StatelessWidget {
  final Widget child;
  const ShimmerColorWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: child,
    );
  }
}

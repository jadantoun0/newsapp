import 'package:flutter/material.dart';
import 'package:newsapp/widgets/shimmer/shimmer_color_widget.dart';
import 'package:newsapp/widgets/shimmer/shimmer_container.dart';

class ArticleShimmerBox extends StatefulWidget {
  const ArticleShimmerBox({super.key});

  @override
  State<ArticleShimmerBox> createState() => _ArticleShimmerBoxState();
}

class _ArticleShimmerBoxState extends State<ArticleShimmerBox> {
  @override
  Widget build(BuildContext context) {
    return ShimmerColorWidget(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: const ShimmerContainer(
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              children: [
                ShimmerContainer(height: 30),
                SizedBox(height: 10),
                ShimmerContainer(height: 30),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ShimmerContainer(height: 20, width: 60),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          const ShimmerContainer(height: 25, width: 25),
        ],
      ),
    );
  }
}

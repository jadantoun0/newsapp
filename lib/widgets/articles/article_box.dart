import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/screens/article_details.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/utils/helper/date_utils.dart';
import 'package:newsapp/utils/helper/navigation_utils.dart';
import 'package:newsapp/widgets/common/custom_cached_image.dart';
import 'package:newsapp/widgets/common/inkwell_with_opacity.dart';

class ArticleBox extends StatefulWidget {
  final ArticleModel articleModel;
  const ArticleBox({super.key, required this.articleModel});

  @override
  State<ArticleBox> createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return InkwellWithOpacity(
      onTap: () {
        NavigationUtils.push(
          context,
          ArticleDetails(
            articleModel: widget.articleModel,
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Hero(
                tag: widget.articleModel.image,
                child: CustomCachedImage(
                  imageUrl: widget.articleModel.image,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.articleModel.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.articleModel.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      color: greyColor,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      CustomDateUtils.timeAgo(
                        widget.articleModel.publishedAt,
                      ),
                      style: TextStyle(
                        color: greyColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.keyboard_arrow_right_sharp,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}

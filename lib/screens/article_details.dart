import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/utils/helper/date_utils.dart';
import 'package:newsapp/widgets/common/custom_cached_image.dart';
import 'package:newsapp/widgets/common/inkwell_with_opacity.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatefulWidget {
  final ArticleModel articleModel;
  const ArticleDetails({
    super.key,
    required this.articleModel,
  });

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.articleModel.image,
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: CustomCachedImage(
                    imageUrl: widget.articleModel.image,
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200]!.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: 40,
                    height: 40,
                    child: const BackButton(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkwellWithOpacity(
                      onTap: () async {
                        Uri uri = Uri.parse(widget.articleModel.source.url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      child: Text(
                        widget.articleModel.source.name,
                        style: const TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      CustomDateUtils.timeAgo(widget.articleModel.publishedAt),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      color: mainColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.articleModel.title,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.articleModel.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(widget.articleModel.content),
                const SizedBox(height: 15),
                InkwellWithOpacity(
                  onTap: () async {
                    Uri uri = Uri.parse(widget.articleModel.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Read complete article',
                        style: TextStyle(color: mainColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: mainColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

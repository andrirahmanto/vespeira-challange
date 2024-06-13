import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrance_test/src/constants/color.dart';
import 'package:entrance_test/src/constants/image.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/star_rating.dart';
import 'package:entrance_test/src/models/rating_model.dart';
import 'package:entrance_test/src/utils/date_util.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final RatingModel rating;
  const ReviewCard({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        imageUrl: rating.profilePicture,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset(
                          defaultProfileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rating.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    StarRating(starCount: rating.rating),
                  ],
                ),
                const Spacer(),
                Text(
                  DateUtil.getTimeAgo(rating.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: gray600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ExpandableText(
            rating.review,
            textAlign: TextAlign.start,
            expandText: 'See More',
            collapseText: 'See Less',
            maxLines: 3,
            linkColor: primary,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

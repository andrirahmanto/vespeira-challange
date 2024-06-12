import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrance_test/src/constants/color.dart';
import 'package:entrance_test/src/constants/image.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/star_rating.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(defaultProfileImage),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amanda Zahra',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    StarRating(starCount: 4),
                  ],
                ),
                Spacer(),
                Text(
                  '1 days ago',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: gray600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          ExpandableText(
            'Produk skincare ini sangat membantu menjaga kondisi kulit saya tetap sehat dan terhidrasi sepanjang hari. Saya sangat merekomendasikan produk ini kepada ...',
            expandText: 'See More',
            collapseText: 'See Less',
            maxLines: 3,
            linkColor: primary,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

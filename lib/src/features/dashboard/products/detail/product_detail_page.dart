import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrance_test/src/constants/color.dart';
import 'package:entrance_test/src/constants/icon.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/component/product_detail_controller.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/review_card.dart';
import 'package:entrance_test/src/utils/number_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray200,
      appBar: AppBar(
          backgroundColor: white,
          title: const Text(
            'Detail Product',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // section 1
                    Container(
                      width: double.infinity,
                      color: white,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CachedNetworkImage(
                              imageUrl: controller
                                          .productDetail.images?.isNotEmpty ==
                                      true
                                  ? controller.productDetail.images![0].url ??
                                      ''
                                  : '',
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                ic_error_image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.productDetail.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                controller.isPriceDiscount()
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.productDetail.price
                                                .inRupiah(),
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: gray600,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            controller
                                                .productDetail.discountPrice
                                                .inRupiah(),
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: red600,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        controller.productDetail.price
                                            .inRupiah(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Image(
                                      height: 16,
                                      width: 16,
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          'assets/icons/icon-star.png'), // Replace with your app logo
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      controller.productDetail.ratingAverage
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '(${controller.productDetail.ratingCount} Reviews)',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: gray600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // section 2
                    Container(
                      width: double.infinity,
                      color: white,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Product Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.productDetail.description!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // section 3
                    Container(
                      width: double.infinity,
                      color: white,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Terms & Conditions of Return / Refund',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: controller.productDetail.returnTerms!
                                .split('\n')
                                .asMap()
                                .entries
                                .map(
                                  (entry) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${entry.key + 1}. ",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          entry.value,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    // section 4
                    controller.ratings.isEmpty
                        ? Container()
                        : Container(
                            width: double.infinity,
                            color: white,
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Product Review',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'See More',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: primary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Image(
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          'assets/icons/icon-star.png'), // Replace with your app logo
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      controller.productDetail.ratingAverage
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "from ${controller.productDetail.ratingCount.toString()} rating",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: gray600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      width: 4.0,
                                      height: 4.0,
                                      decoration: const BoxDecoration(
                                        color: gray600,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${controller.ratings.length} reviews',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: gray600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                ReviewCard(rating: controller.ratings[0]),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:entrance_test/src/constants/color.dart';
import 'package:entrance_test/src/constants/icon.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/component/product_detail_controller.dart';
import 'package:entrance_test/src/features/dashboard/products/detail/review_card.dart';
import 'package:entrance_test/src/utils/number_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray200,
      appBar: AppBar(
          backgroundColor: white,
          title: Text(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // section 1
            Container(
              width: double.infinity,
              color: white,
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      ic_error_image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Triple Set Concentrate WX Bpom for Dark Spots',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        334000.inRupiah(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          color: gray600,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        100000.inRupiah(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          color: red600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   334000.inRupiah(),
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w700,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image(
                        height: 16,
                        width: 16,
                        fit: BoxFit.contain,
                        image: AssetImage(
                            'assets/icons/icon-star.png'), // Replace with your app logo
                      ),
                      SizedBox(width: 2),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '(100 Reviews)',
                        style: TextStyle(
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
            // section 2
            Container(
              width: double.infinity,
              color: white,
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Triple Set Concentrate WX BPOM for Dark Spots merupakan paket hemat untuk mengatasi flek melasma, mencerahkan dan merawat kulit. *Bumil & busui friendly.",
                    style: TextStyle(
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
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Conditions of Return / Refund',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mohon untuk bisa melakukan video unboxing (pembukaan paket), foto penerimaan produk, foto resi dan label pembeli saat paket sudah berhasil diterima sehingga jika ada kerusakan, kekurangan produk/hadiah, atau ketidaksesuaian produk yang diterima bisa dilakukan validasi melalui kelengkapan tersebut\nJika tidak ada atau hanya memiliki salah satu dari kelengkapan yang disebutkan, maka segala bentuk komplain yang masuk tidak bisa ditindaklanjuti atau dianggap tidak sah, kecuali memang ada kesalahan dari sisi penjual\nKerusakan packaging hanya pada bagian luar (bagian dalam utuh, produk tidak ada kerusakan/kekurangan, dll) disebabkan penanganan paket dari pihak jasa ekspedisi yang kurang baik, diharapkan agar pembeli bisa melakukan komplain langsung ke pihak jasa ekspedisi',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // section 4
            Container(
              width: double.infinity,
              color: white,
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image(
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                        image: AssetImage(
                            'assets/icons/icon-star.png'), // Replace with your app logo
                      ),
                      SizedBox(width: 2),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'from 302 rating',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: gray600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Container(
                        width: 4.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: gray600,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '248 reviews',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: gray600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ReviewCard(),
                  ReviewCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

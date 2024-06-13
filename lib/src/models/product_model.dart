import 'package:entrance_test/src/models/rating_model.dart';
import 'package:get/get.dart';

import 'product_image_model.dart';

class ProductModel {
  final String id;
  final String name;
  final int price;
  final int discountPrice;
  final List<ProductImageModel>? images;
  final bool? isPrescriptionDrugs;
  final String? description;
  final String? returnTerms;
  final String? ratingAverage;
  final int? ratingCount;
  final int? reviewCount;
  final List<RatingModel>? ratings;

  final _isFavorite = false.obs;
  bool get isFavorite => _isFavorite.value;
  set isFavorite(bool newValue) => _isFavorite.value = newValue;

  static const _defaultDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, varius nunc. Nulla facilisi. Nullam ac nisi non nunc vehicula sagittis. Nullam sit amet magna in magna gravida vehicula. Nullam euismod, purus nec ultricies luctus, nunc turpis suscipit lacus, vel luctus diam libero sit amet nunc. Nullam auctor';

  static const _defaultReturnTerms =
      'Mohon untuk bisa melakukan video unboxing (pembukaan paket), foto penerimaan produk, foto resi dan label pembeli saat paket sudah berhasil diterima sehingga jika ada kerusakan, kekurangan produk/hadiah, atau ketidaksesuaian produk yang diterima bisa dilakukan validasi melalui kelengkapan tersebut\nJika tidak ada atau hanya memiliki salah satu dari kelengkapan yang disebutkan, maka segala bentuk komplain yang masuk tidak bisa ditindaklanjuti atau dianggap tidak sah, kecuali memang ada kesalahan dari sisi penjual\nKerusakan packaging hanya pada bagian luar (bagian dalam utuh, produk tidak ada kerusakan/kekurangan, dll) disebabkan penanganan paket dari pihak jasa ekspedisi yang kurang baik, diharapkan agar pembeli bisa melakukan komplain langsung ke pihak jasa ekspedisi.';

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    this.description = _defaultDescription,
    this.returnTerms = _defaultReturnTerms,
    this.isPrescriptionDrugs,
    this.ratingAverage,
    this.ratingCount,
    this.reviewCount,
    this.ratings,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ProductImageModel.fromJson(e))
            .toList(),
        price: json['price'],
        discountPrice: json['price_after_discount'],
        isPrescriptionDrugs: json['is_prescription_drugs'],
        description: json['description'] ?? _defaultDescription,
        returnTerms: json['refund_terms_and_condition'] ?? _defaultReturnTerms,
        ratingAverage: json['rating_average'],
        ratingCount: json['rating_count'],
        reviewCount: json['review_count'],
        ratings: (json['ratings'] as List<dynamic>?)
                ?.map((e) => RatingModel.fromJson(e))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'images': images,
        'price': price,
        'price_after_discount': discountPrice,
        if (isPrescriptionDrugs != null)
          'is_prescription_drugs': isPrescriptionDrugs,
        if (description != null) 'description': description,
        if (returnTerms != null) 'refund_terms_and_condition': returnTerms,
        if (ratingAverage != null) 'rating_average': ratingAverage,
        if (ratingCount != null) 'rating_count': ratingCount,
        if (reviewCount != null) 'review_count': reviewCount,
      };
}

enum ProductSort {
  newest,
  priceAscending,
  priceDescending,
  nameAscending,
  nameDescending,
}

extension SortExtension on ProductSort {
  String get name {
    switch (this) {
      case ProductSort.newest:
        return 'Newest';
      case ProductSort.priceAscending:
        return 'Price: Low to High';
      case ProductSort.priceDescending:
        return 'Price: High to Low';
      case ProductSort.nameAscending:
        return 'Alphabet: A to Z';
      case ProductSort.nameDescending:
        return 'Alphabet: Z to A';
      default:
        return 'Newest';
    }
  }
}

class SortType {
  static String getSortByValue(ProductSort sort) {
    switch (sort) {
      case ProductSort.newest:
        return 'created_at';
      case ProductSort.nameAscending:
        return 'name';
      case ProductSort.nameDescending:
        return 'name';
      case ProductSort.priceAscending:
        return 'price';
      case ProductSort.priceDescending:
        return 'price';
      default:
        return 'id';
    }
  }

  static String getSortColumnValue(ProductSort sort) {
    switch (sort) {
      case ProductSort.newest:
        return 'desc';
      case ProductSort.nameAscending:
        return 'asc';
      case ProductSort.nameDescending:
        return 'desc';
      case ProductSort.priceAscending:
        return 'asc';
      case ProductSort.priceDescending:
        return 'desc';
      default:
        return 'asc';
    }
  }
}

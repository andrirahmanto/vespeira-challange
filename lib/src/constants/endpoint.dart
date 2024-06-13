class Endpoint {
  static const baseUrl = 'http://develop-at.vesperia.id:1091/api/v1';

  static const signin = '$baseUrl/sign-in';
  static const signout = '$baseUrl/sign-out';
  static const updateUser = '$baseUrl/user/profile';
  static const getUser = '/user';

  static const getProductList = '/product';
  static String getProductById(String id) => '/product/$id';
  static String getRatings({
    required String productId,
    int page = 1,
    int limit = 3,
    String sortColumn = 'created_at',
    String sortOrder = 'desc',
  }) {
    return '$baseUrl/rating?page=$page&limit=$limit&sort_column=$sortColumn&sort_order=$sortOrder&product_id=$productId';
  }
}

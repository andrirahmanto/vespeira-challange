class RatingModel {
  RatingModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.review,
    required this.profilePicture,
    required this.createdAt,
  });

  final String id;
  final String name;
  final int rating;
  final String review;
  final String profilePicture;
  final DateTime createdAt;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json['id'],
        name: json['user']['name'],
        rating: json['rating'],
        review: json['review'],
        profilePicture: json['user']['profile_picture'],
        createdAt: DateTime.parse(json['created_at']),
      );
}

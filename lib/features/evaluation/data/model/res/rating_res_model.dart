class RatingResModel {
  Comment comment;

  RatingResModel({
    required this.comment,
  });

  factory RatingResModel.fromJson(Map<String, dynamic> json) => RatingResModel(
    comment: Comment.fromJson(json["comment"]),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment.toJson(),
  };
}

class Comment {
  String reservationId;
  String? comment;
  String? rating;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Comment({
    required this.reservationId,
    required this.comment,
    required this.rating,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    reservationId: json["reservation_id"],
    comment: json["comment"],
    rating: json["rating"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "reservation_id": reservationId,
    "comment": comment,
    "rating": rating,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

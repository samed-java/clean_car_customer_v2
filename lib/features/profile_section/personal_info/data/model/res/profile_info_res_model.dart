class ProfileInfoResModel {
  User user;

  ProfileInfoResModel({
    required this.user,
  });

  factory ProfileInfoResModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoResModel(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  String? name;
  String? email;
  String? phone;

  User({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}
